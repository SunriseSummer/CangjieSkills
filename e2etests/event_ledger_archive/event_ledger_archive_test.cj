package event_ledger_archive

import std.collection.{ArrayList, HashMap, HashSet}
import std.fs.{File, Path, exists, removeIfExists}
import std.io.ByteBuffer
import std.math.numeric.BigInt

/*
 * Frozen acceptance suite for event_ledger_archive.
 *
 * Every case is deterministic: no randomness, no wall-clock time, no network,
 * and no assertion depends on hash traversal order. Non-ASCII literals use
 * \u{...} escapes so the expectations survive any source re-encoding.
 */

// ---------------------------------------------------------------- helpers

func money(text: String): Money {
    return Money.parse(text).getOrThrow()
}

func account(raw: String): AccountRef {
    return parseAccount(raw).getOrThrow()
}

/** Fixed event used by the wire-format cases; tags stay in the given order. */
func sampleEvent(): LedgerEvent {
    return LedgerEvent(
        7,
        AccountRef("eu", "ACC42"),
        EventKind.Credit(money("120.50")),
        Priority.Elevated,
        ["alpha", "beta"],
        Some("memo")
    )
}

/** Compact JSON of `sampleEvent()`, byte-for-byte. */
const SAMPLE_EVENT_JSON = ##"{"seq":7,"account":{"region":"eu","code":"ACC42"},"kind":{"type":"credit","amount":"120.50"},"priority":"elevated","tags":["alpha","beta"],"memo":"memo"}"##

func demoFrame(): Array<Byte> {
    return encodeFrame(encodeJsonBytes(buildDemoLedger().toEnvelope<BatchNote>(Some(demoNote()))))
}

func joinInts(values: Array<Int64>): String {
    let parts = ArrayList<String>()
    for (value in values) {
        parts.add("${value}")
    }
    return String.join(parts.toArray(), delimiter: ",")
}

func lineStartingWith(lines: Array<String>, prefix: String): String {
    for (line in lines) {
        if (line.startsWith(prefix)) {
            return line
        }
    }
    throw LedgerException("no report line starts with '${prefix}'")
}

// ------------------------------------------- A. derive and value semantics

@Test
func deriveEquatableAccount(): Unit {
    @Expect(AccountRef("eu", "ACC42") == AccountRef("eu", "ACC42"), true)
    @Expect(AccountRef("eu", "ACC42") == AccountRef("us", "ACC42"), false)
    @Expect(AccountRef("eu", "ACC42") != AccountRef("eu", "ACC43"), true)
}

@Test
func deriveHashableAccountDedups(): Unit {
    let left = AccountRef("eu", "ACC42")
    let right = AccountRef("eu", "ACC42")
    @Expect(left.hashCode() == right.hashCode(), true)
    let seen = HashSet<AccountRef>()
    seen.add(left)
    seen.add(right)
    seen.add(AccountRef("us", "ACC7"))
    @Expect(seen.size, 2)
    @Expect(seen.contains(AccountRef("eu", "ACC42")), true)
}

@Test
func deriveToStringFormats(): Unit {
    @Expect(AccountRef("eu", "ACC42").toString(), "AccountRef(region: eu, code: ACC42)")
    @Expect(Priority.Urgent.toString(), "Priority.Urgent")
    @Expect(Priority.Routine.toString(), "Priority.Routine")
    @Expect(Money.fromUnits(3).toString(), "Money(minorUnits: 300)")
    @Expect(ArchiveHeader(10, 5).toString(), "ArchiveHeader(rawLength: 10, payloadLength: 5)")
    @Expect(RuneProfile(2, 1, 2).toString(), "RuneProfile(letters: 2, digits: 1, spaces: 2)")
}

@Test
func deriveComparableOrdersRegionBeforeCode(): Unit {
    // Region dominates even when the code sorts the other way.
    @Expect(AccountRef("eu", "ZZZ9") < AccountRef("us", "AAA1"), true)
    @Expect(AccountRef("eu", "ACC1") < AccountRef("eu", "ACC2"), true)
    @Expect(AccountRef("eu", "ACC2") > AccountRef("eu", "ACC1"), true)
    @Expect(AccountRef("eu", "ACC1") <= AccountRef("eu", "ACC1"), true)
}

@Test
func deriveComparableMoneyByMinorUnits(): Unit {
    @Expect(money("-5.00") < money("0.00"), true)
    @Expect(money("120.50") > money("20.25"), true)
    @Expect(money("12.34") == Money(BigInt(1234)), true)
    @Expect(Money.zero().isZero(), true)
    @Expect(money("0.001").isZero(), true)
}

// -------------------------------- B. generic enum, pattern matching, Option

@Test
func validatedCarriesValue(): Unit {
    let outcome = Money.parse("1.00")
    @Expect(outcome.isValid(), true)
    @Expect(outcome.reasonOr("none"), "none")
    @Expect(outcome.getOrThrow().text(), "1.00")
}

@Test
func validatedCarriesFailureTag(): Unit {
    let outcome = Money.parse("not-a-number")
    @Expect(outcome.isValid(), false)
    @Expect(outcome.reasonOr("none"), "unparsable-amount")
    try {
        outcome.getOrThrow()
        @Fail("getOrThrow must reject an Invalid value")
    } catch (failure: LedgerException) {
        @Expect(failure.message, "invalid value: unparsable-amount")
    }
}

@Test
func validatedMapKeepsFailureUntouched(): Unit {
    let good = Money.parse("2.50").map<String>({m: Money => m.text()})
    @Expect(good.getOrThrow(), "2.50")
    let bad = Money.parse("oops").map<String>({m: Money => m.text()})
    @Expect(bad.isValid(), false)
    @Expect(bad.reasonOr("none"), "unparsable-amount")
    let priority = Priority.parse("nope").map<Int64>({p: Priority => p.rank()})
    @Expect(priority.reasonOr("none"), "unknown-priority")
    @Expect(Priority.parse("urgent").map<Int64>({p: Priority => p.rank()}).getOrThrow(), 2)
}

@Test
func eventKindPatternMatchExtractsPayloads(): Unit {
    let target = AccountRef("us", "ACC7")
    let kinds = [
        EventKind.Credit(money("1.00")),
        EventKind.Debit(money("2.00")),
        EventKind.Transfer(target, money("3.00")),
        EventKind.Note("hello")
    ]
    let described = ArrayList<String>()
    for (kind in kinds) {
        let text = match (kind) {
            case Credit(amount) => "credit/${amount.text()}"
            case Debit(amount) => "debit/${amount.text()}"
            case Transfer(counterparty, amount) => "transfer/${counterparty.render()}/${amount.text()}"
            case Note(body) => "note/${body}"
        }
        described.add(text)
    }
    @Expect(String.join(described.toArray(), delimiter: " "),
        "credit/1.00 debit/2.00 transfer/us:ACC7/3.00 note/hello")
}

@Test
func eventKindTagAndBalanceDelta(): Unit {
    let target = AccountRef("us", "ACC7")
    @Expect(EventKind.Credit(money("1.00")).tag(), "credit")
    @Expect(EventKind.Debit(money("1.00")).tag(), "debit")
    @Expect(EventKind.Transfer(target, money("1.00")).tag(), "transfer")
    @Expect(EventKind.Note("x").tag(), "note")
    @Expect(EventKind.Credit(money("1.00")).balanceDelta().text(), "1.00")
    @Expect(EventKind.Debit(money("1.00")).balanceDelta().text(), "-1.00")
    @Expect(EventKind.Transfer(target, money("1.00")).balanceDelta().text(), "-1.00")
    @Expect(EventKind.Note("x").balanceDelta().isZero(), true)
}

@Test
func extendProvidesEventKindDisplay(): Unit {
    @Expect(EventKind.Credit(money("120.50")).toString(), "credit(120.50)")
    @Expect(EventKind.Debit(money("20.25")).toString(), "debit(20.25)")
    @Expect(
        EventKind.Transfer(AccountRef("eu", "ACC42"), money("5")).toString(),
        "transfer(eu:ACC42,5.00)"
    )
    @Expect(EventKind.Note("audit").toString(), "note(audit)")
}

@Test
func optionMemoDistinguishesNoneFromEmpty(): Unit {
    let withMemo = sampleEvent()
    @Expect(withMemo.memo.isSome(), true)
    @Expect(withMemo.toString().startsWith("#7 eu:ACC42 credit(120.50) elevated [alpha,beta] memo"), true)
    let withoutMemo = LedgerEvent(
        8,
        AccountRef("eu", "ACC42"),
        EventKind.Note("n"),
        Priority.Routine,
        [],
        None
    )
    @Expect(withoutMemo.memo.isNone(), true)
    @Expect(withoutMemo.toString(), "#8 eu:ACC42 note(n) routine [] -")
    let empty = LedgerEvent(9, AccountRef("eu", "ACC42"), EventKind.Note("n"), Priority.Routine, [], Some(""))
    @Expect(empty.toString(), "#9 eu:ACC42 note(n) routine [] ")
}

// ---------------------------------- C. Decimal, BigInt and RoundingMode

@Test
func moneyParseRoundsHalfEven(): Unit {
    // Ties go to the even neighbour: 12.345 -> 12.34, 12.355 -> 12.36.
    @Expect(money("12.345").text(), "12.34")
    @Expect(money("12.355").text(), "12.36")
    @Expect(money("120.505").text(), "120.50")
    @Expect(money("120.515").text(), "120.52")
    @Expect(money("-12.345").text(), "-12.34")
}

@Test
func moneyTextAlwaysKeepsTwoDecimals(): Unit {
    @Expect(Money.zero().text(), "0.00")
    @Expect(money("-5").text(), "-5.00")
    @Expect(money("7").text(), "7.00")
    @Expect(Money.fromUnits(7).text(), "7.00")
    @Expect(money("0.1").text(), "0.10")
    @Expect(Money.SCALE, 2)
}

@Test
func moneyKeepsExactScaleAndMinorUnits(): Unit {
    let value = money("120.50")
    @Expect(value.minorUnits == BigInt(12050), true)
    @Expect(value.amount().scale, 2)
    @Expect(value.amount().toString(), "120.50")
    @Expect(Money.fromUnits(5).minorUnits == BigInt(500), true)
}

@Test
func moneyArithmeticIsExact(): Unit {
    // 0.10 summed ten times is exactly 1.00; a Float64 pipeline would not be.
    var total = Money.zero()
    for (_ in 0..10) {
        total = total.plus(money("0.10"))
    }
    @Expect(total.text(), "1.00")
    @Expect(total.minorUnits == BigInt(100), true)
    @Expect(money("120.50").plus(money("20.25").negated()).text(), "100.25")
    @Expect(money("5.00").negated().negated().text(), "5.00")
}

@Test
func moneyShareRoundsAndRejectsBadDenominator(): Unit {
    @Expect(money("10.00").sharePerPart(3).text(), "3.33")
    @Expect(money("10.00").sharePerPart(4).text(), "2.50")
    // Exact ties resolve toward the even last digit, in both directions:
    // 0.05/2 == 0.025 -> 0.02, while 0.15/2 == 0.075 -> 0.08.
    @Expect(money("0.05").sharePerPart(2).text(), "0.02")
    @Expect(money("0.15").sharePerPart(2).text(), "0.08")
    @Expect(money("-10.00").sharePerPart(3).text(), "-3.33")
    try {
        money("1.00").sharePerPart(0)
        @Fail("a non-positive denominator must be rejected")
    } catch (failure: LedgerException) {
        @Expect(failure.message, "share denominator must be positive")
    }
}

@Test
func bigIntProjectionSumsWideValues(): Unit {
    // Far beyond Int64 minor units, so only an arbitrary-precision sum works.
    let huge = "92233720368547758070"
    let ledger = EventLedger()
    ledger.record(
        LedgerEvent(1, AccountRef("eu", "ACC42"), EventKind.Credit(money(huge)),
            Priority.Routine, [], None)
    )
    ledger.record(
        LedgerEvent(2, AccountRef("eu", "ACC42"), EventKind.Debit(money(huge)),
            Priority.Routine, [], None)
    )
    @Expect(ledger.project<Money>(NetBalanceProjection()), "net=0.00")
    @Expect(ledger.project<BigInt>(GrossVolumeProjection()), "gross=18446744073709551614000")
}

// ------------------------------------------------- D. Unicode and Regex

@Test
func stringLevelUpperCaseMayGrowRuneCount(): Unit {
    // \u{df} is the German sharp s; its string-level uppercase is two runes.
    let sharp = "stra\u{df}e"
    @Expect(sharp.toRuneArray().size, 6)
    @Expect(normalizeCode(sharp), "STRASSE")
    @Expect(normalizeCode(sharp).toRuneArray().size, 7)
    @Expect(normalizeRegion("  EU  "), "eu")
    @Expect(normalizeCode(" acc42 "), "ACC42")
}

@Test
func runeLevelFlipCannotExpand(): Unit {
    // A single Rune cannot hold the two-rune uppercase of \u{df}.
    @Expect(flipRuneCase(r'\u{df}'), r'\u{df}')
    @Expect(flipRuneCase(r'\u{c4}'), r'\u{e4}')
    @Expect(flipRuneCase(r'\u{e4}'), r'\u{c4}')
    @Expect(flipRuneCase(r'a'), r'A')
    @Expect(flipRuneCase(r'Z'), r'z')
    @Expect(flipRuneCase(r'7'), r'7')
    @Expect(flipRuneCase(r'-'), r'-')
}

@Test
func parseAccountNormalizesBeforeValidating(): Unit {
    let expected = AccountRef("eu", "ACC42")
    @Expect(account(" Eu:acc42 ") == expected, true)
    @Expect(account("eu:ACC42") == expected, true)
    @Expect(account("EU:acc42") == expected, true)
    @Expect(account("us:ACC7").render(), "us:ACC7")
    @Expect(account("eu:ABC123456").code, "ABC123456")
}

@Test
func parseAccountRejectsMalformedInput(): Unit {
    @Expect(parseAccount("eu-ACC42").reasonOr("ok"), "missing-separator")
    @Expect(parseAccount("e:ACC42").reasonOr("ok"), "malformed-account")
    @Expect(parseAccount("eur:ACC42").reasonOr("ok"), "malformed-account")
    @Expect(parseAccount("eu:AC42").reasonOr("ok"), "malformed-account")
    @Expect(parseAccount("eu:ACC").reasonOr("ok"), "malformed-account")
    @Expect(parseAccount("eu:ACC1234567").reasonOr("ok"), "malformed-account")
    @Expect(parseAccount("").reasonOr("ok"), "missing-separator")
    @Expect(parseAccount("eu:ACC42").isValid(), true)
}

@Test
func canonicalTagFoldsUnicodeAndSeparators(): Unit {
    @Expect(canonicalTag("  Hello, W\u{f6}rld! "), "hello-w\u{f6}rld")
    @Expect(canonicalTag("  EU  "), "eu")
    @Expect(canonicalTag("Payroll"), "payroll")
    @Expect(canonicalTag("A__B"), "a-b")
    @Expect(canonicalTag("a---b"), "a-b")
    @Expect(canonicalTag("---"), "")
    @Expect(canonicalTag(""), "")
    @Expect(canonicalTag("\u{c4}pfel 2024"), "\u{e4}pfel-2024")
}

@Test
func extractTagsUsesRegexInFirstAppearanceOrder(): Unit {
    let found = extractTags("a #one and #Two-x plus ## none #one again")
    @Expect(String.join(found, delimiter: "|"), "one|two-x|one")
    @Expect(extractTags("no tags here").size, 0)
    @Expect(String.join(extractTags("#\u{c4}pfel"), delimiter: "|"), "\u{e4}pfel")
    @Expect(String.join(extractTags("#a1 #_b"), delimiter: "|"), "a1|b")
}

@Test
func classifyRunesCountsCategoriesOnce(): Unit {
    let profile = classifyRunes("a\u{e4} 7 ")
    @Expect(profile, RuneProfile(2, 1, 2))
    @Expect(profile.letters, 2)
    @Expect(profile.digits, 1)
    @Expect(profile.spaces, 2)
    @Expect(profile.counted(), 5)
    // Punctuation belongs to no counted category.
    @Expect(classifyRunes("a,b").counted(), 2)
    @Expect(classifyRunes("").counted(), 0)
}

// ------------------------------------------- E. collections and ordering

@Test
func ledgerRejectsDuplicateSequence(): Unit {
    let ledger = EventLedger()
    let event = sampleEvent()
    ledger.record(event)
    @Expect(ledger.size, 1)
    try {
        ledger.record(event)
        @Fail("a duplicate sequence must be rejected")
    } catch (failure: LedgerException) {
        @Expect(failure.message, "duplicate sequence 7")
    }
    @Expect(ledger.size, 1)
}

@Test
func ledgerCanonicalizesDedupsAndSortsTags(): Unit {
    let ledger = EventLedger()
    ledger.record(
        LedgerEvent(
            1,
            AccountRef("eu", "ACC42"),
            EventKind.Note("n"),
            Priority.Routine,
            ["  Zeta  ", "alpha", "ALPHA", "---", "Be Ta"],
            None
        )
    )
    let stored = ledger.bySequence()[0]
    @Expect(String.join(stored.tags, delimiter: ","), "alpha,be-ta,zeta")
}

@Test
func ledgerOrdersBySequenceAndPriority(): Unit {
    let ledger = buildDemoLedger()
    let sequenced = ArrayList<String>()
    for (event in ledger.bySequence()) {
        sequenced.add("${event.seq}")
    }
    @Expect(String.join(sequenced.toArray(), delimiter: ","), "1,2,3,4")

    // Priority descending; equal ranks keep ascending sequence order.
    let prioritized = ArrayList<String>()
    for (event in ledger.byPriority()) {
        prioritized.add("${event.seq}${event.priority.code()[0..1]}")
    }
    @Expect(String.join(prioritized.toArray(), delimiter: ","), "3u,2e,1r,4r")
}

@Test
func ledgerOrdersByImpactDescending(): Unit {
    // Deltas: 1 -> +120.50, 2 -> -20.25, 3 -> -5.00, 4 -> 0.00.
    let impacted = ArrayList<String>()
    for (event in buildDemoLedger().byImpact()) {
        impacted.add("${event.seq}=${event.kind.balanceDelta().text()}")
    }
    @Expect(String.join(impacted.toArray(), delimiter: ","), "1=120.50,4=0.00,3=-5.00,2=-20.25")
}

@Test
func ledgerAccountIndexGroupsAscendingSequences(): Unit {
    let index = buildDemoLedger().accountIndex()
    @Expect(index.size, 2)
    let eu = index[AccountRef("eu", "ACC42")]
    let us = index[AccountRef("us", "ACC7")]
    @Expect(joinInts(eu), "1,2")
    @Expect(joinInts(us), "3,4")
}

@Test
func ledgerTagVocabularyIsASetWithSortedView(): Unit {
    let ledger = buildDemoLedger()
    let vocabulary = ledger.tagVocabulary()
    @Expect(vocabulary.size, 4)
    @Expect(vocabulary.contains("eu"), true)
    @Expect(vocabulary.contains("payroll"), true)
    @Expect(vocabulary.contains("EU"), false)
    // Sorted view never depends on hash traversal order.
    @Expect(String.join(ledger.sortedTags(), delimiter: ","), "eu,fees,payroll,rebalance")
}

@Test
func ledgerBalancesAreExactAndSorted(): Unit {
    let ledger = buildDemoLedger()
    @Expect(ledger.balanceOf(AccountRef("eu", "ACC42")).text(), "100.25")
    @Expect(ledger.balanceOf(AccountRef("us", "ACC7")).text(), "-5.00")
    @Expect(ledger.balanceOf(AccountRef("jp", "ACC1")).text(), "0.00")
    @Expect(ledger.balances().size, 2)
    @Expect(String.join(ledger.balanceReport(), delimiter: " "), "eu:ACC42=100.25 us:ACC7=-5.00")
}

@Test
func projectionsRenderDeterministically(): Unit {
    let ledger = buildDemoLedger()
    @Expect(ledger.project<Money>(NetBalanceProjection()), "net=95.25")
    @Expect(
        ledger.project<HashMap<String, Int64>>(KindHistogramProjection()),
        "kinds=credit:1|debit:1|note:1|transfer:1"
    )
    @Expect(ledger.project<BigInt>(GrossVolumeProjection()), "gross=14575")
    @Expect(EventLedger().project<Money>(NetBalanceProjection()), "net=0.00")
    @Expect(EventLedger().project<HashMap<String, Int64>>(KindHistogramProjection()), "kinds=")
}

// ------------------------------------------------- F. streaming JSON codec

@Test
func moneyAndAccountUseStableWireForms(): Unit {
    @Expect(encodeJsonText(money("120.50")), ##""120.50""##)
    @Expect(encodeJsonText(Money.zero()), ##""0.00""##)
    @Expect(encodeJsonText(AccountRef("eu", "ACC42")), ##"{"region":"eu","code":"ACC42"}"##)
    @Expect(decodeJsonText<Money>(##""120.50""##).text(), "120.50")
    @Expect(decodeJsonText<AccountRef>(##"{"region":"eu","code":"ACC42"}"##).render(), "eu:ACC42")
}

@Test
func eventKindWireFormsCoverEveryArm(): Unit {
    @Expect(
        encodeJsonText(EventKind.Credit(money("120.50"))),
        ##"{"type":"credit","amount":"120.50"}"##
    )
    @Expect(
        encodeJsonText(EventKind.Debit(money("20.25"))),
        ##"{"type":"debit","amount":"20.25"}"##
    )
    @Expect(
        encodeJsonText(EventKind.Transfer(AccountRef("eu", "ACC42"), money("5"))),
        ##"{"type":"transfer","amount":"5.00","counterparty":{"region":"eu","code":"ACC42"}}"##
    )
    @Expect(encodeJsonText(EventKind.Note("audit")), ##"{"type":"note","text":"audit"}"##)
}

@Test
func eventJsonRoundTripIsByteStable(): Unit {
    let encoded = encodeJsonText(sampleEvent())
    @Expect(encoded, SAMPLE_EVENT_JSON)
    let restored = decodeJsonText<LedgerEvent>(encoded)
    @Expect(restored.seq, 7)
    @Expect(restored.account.render(), "eu:ACC42")
    @Expect(restored.priority.code(), "elevated")
    @Expect(String.join(restored.tags, delimiter: ","), "alpha,beta")
    @Expect(restored.memo.getOrThrow(), "memo")
    @Expect(encodeJsonText(restored), encoded)
}

@Test
func nullMemoRoundTripsAsNone(): Unit {
    let event = LedgerEvent(
        3, AccountRef("us", "ACC7"), EventKind.Note("n"), Priority.Routine, [], None
    )
    let encoded = encodeJsonText(event)
    @Expect(encoded.contains(##""memo":null"##), true)
    let restored = decodeJsonText<LedgerEvent>(encoded)
    @Expect(restored.memo.isNone(), true)
    @Expect(encodeJsonText(restored), encoded)
}

@Test
func readerSkipsUnknownFieldsOfEveryShape(): Unit {
    // Unknown scalars, nested objects, nested arrays and nulls must all be
    // consumed whole, leaving reader state synchronized with the structure.
    let noisy = ##"{"seq":7,"extraNull":null,"account":{"region":"eu","zz":[1,{"deep":true}],"code":"ACC42"},"extraNum":3.5,"kind":{"unused":{"a":[[]]},"type":"credit","amount":"120.50"},"priority":"elevated","extraArr":[1,2,[3]],"tags":["alpha","beta"],"memo":"memo","trailing":"x"}"##
    let restored = decodeJsonText<LedgerEvent>(noisy)
    @Expect(encodeJsonText(restored), SAMPLE_EVENT_JSON)
}

@Test
func kindDiscriminatorMayAppearInAnyPosition(): Unit {
    let amountFirst = decodeJsonText<EventKind>(##"{"amount":"5.00","counterparty":{"region":"eu","code":"ACC42"},"type":"transfer"}"##)
    @Expect(amountFirst.toString(), "transfer(eu:ACC42,5.00)")
    let middle = decodeJsonText<EventKind>(##"{"amount":"1.25","type":"debit","ignored":[1]}"##)
    @Expect(middle.toString(), "debit(1.25)")
}

@Test
func compositeArraysUseElementWisePath(): Unit {
    // tags and events are read item by item rather than through the generic
    // array deserializer, which is the portable path on Windows cjnative.
    let event = LedgerEvent(
        1, AccountRef("eu", "ACC42"), EventKind.Note("n"), Priority.Routine,
        ["a", "b", "c"], None
    )
    let restored = decodeJsonText<LedgerEvent>(encodeJsonText(event))
    @Expect(restored.tags.size, 3)
    @Expect(String.join(restored.tags, delimiter: ","), "a,b,c")

    let emptyTags = decodeJsonText<LedgerEvent>(
        ##"{"seq":2,"account":{"region":"eu","code":"ACC42"},"kind":{"type":"note","text":"n"},"priority":"routine","tags":[],"memo":null}"##
    )
    @Expect(emptyTags.tags.size, 0)

    let envelope = decodeJsonText<Envelope<BatchNote>>(
        ##"{"schema":"event-ledger/1","events":[],"annotation":null}"##
    )
    @Expect(envelope.events.size, 0)
    @Expect(envelope.annotation.isNone(), true)
}

@Test
func envelopeCarriesGenericAnnotation(): Unit {
    let ledger = buildDemoLedger()
    let envelope = ledger.toEnvelope<BatchNote>(Some(demoNote()))
    @Expect(envelope.schema, ENVELOPE_SCHEMA)
    @Expect(envelope.events.size, 4)
    let text = encodeJsonText(envelope)
    @Expect(text.startsWith(##"{"schema":"event-ledger/1","events":["##), true)
    @Expect(text.contains(##""annotation":{"author":"oracle","comment":"deterministic demo batch"}"##), true)

    let restored = decodeJsonText<Envelope<BatchNote>>(text)
    @Expect(restored.events.size, 4)
    @Expect(restored.annotation.getOrThrow().toString(), "oracle: deterministic demo batch")
    @Expect(encodeJsonText(restored), text)

    let bare = ledger.toEnvelope<BatchNote>(None)
    @Expect(encodeJsonText(bare).contains(##""annotation":null"##), true)
    @Expect(decodeJsonText<Envelope<BatchNote>>(encodeJsonText(bare)).annotation.isNone(), true)
}

@Test
func codecRejectsMissingAndUnknownStructure(): Unit {
    func failure(text: String): String {
        try {
            decodeJsonText<LedgerEvent>(text)
            return "accepted"
        } catch (problem: LedgerException) {
            return problem.message
        }
    }
    @Expect(
        failure(##"{"account":{"region":"eu","code":"ACC42"},"kind":{"type":"note","text":"n"},"priority":"routine","tags":[],"memo":null}"##),
        "event is missing 'seq'"
    )
    @Expect(failure(##"{"seq":1,"kind":{"type":"note","text":"n"},"priority":"routine","tags":[],"memo":null}"##),
        "event is missing 'account'")
    @Expect(failure(##"{"seq":1,"account":{"region":"eu","code":"ACC42"},"priority":"routine","tags":[],"memo":null}"##),
        "event is missing 'kind'")
    @Expect(failure(##"{"seq":1,"account":{"region":"eu","code":"ACC42"},"kind":{"type":"credit"},"priority":"routine","tags":[],"memo":null}"##),
        "kind 'credit' is missing 'amount'")
    @Expect(failure(##"{"seq":1,"account":{"region":"eu","code":"ACC42"},"kind":{"type":"transfer","amount":"1.00"},"priority":"routine","tags":[],"memo":null}"##),
        "kind 'transfer' is missing 'counterparty'")
    @Expect(failure(##"{"seq":1,"account":{"region":"eu","code":"ACC42"},"kind":{"type":"note"},"priority":"routine","tags":[],"memo":null}"##),
        "kind 'note' is missing 'text'")
    @Expect(failure(##"{"seq":1,"account":{"region":"eu","code":"ACC42"},"kind":{"type":"wire","amount":"1.00"},"priority":"routine","tags":[],"memo":null}"##),
        "unknown kind 'wire'")
    @Expect(failure(##"{"seq":1,"account":{"region":"eu","code":"ACC42"},"kind":{"type":"credit","amount":"x"},"priority":"routine","tags":[],"memo":null}"##),
        "bad amount 'x': unparsable-amount")
}

@Test
func envelopeRejectsUnsupportedSchema(): Unit {
    try {
        decodeJsonText<Envelope<BatchNote>>(##"{"schema":"event-ledger/2","events":[],"annotation":null}"##)
        @Fail("an unsupported schema must be rejected")
    } catch (failure: LedgerException) {
        @Expect(failure.message, "unsupported schema 'event-ledger/2'")
    }
}

@Test
func priorityTokensRoundTripAndRejectUnknown(): Unit {
    @Expect(Priority.parse("routine").getOrThrow().rank(), 0)
    @Expect(Priority.parse("elevated").getOrThrow().rank(), 1)
    @Expect(Priority.parse("urgent").getOrThrow().rank(), 2)
    @Expect(Priority.parse(Priority.Elevated.code()).getOrThrow() == Priority.Elevated, true)
    @Expect(Priority.parse("Urgent").reasonOr("ok"), "unknown-priority")
    @Expect(Priority.parse("").reasonOr("ok"), "unknown-priority")
}

@Test
func multiByteTextSurvivesTheJsonBoundary(): Unit {
    let event = LedgerEvent(
        1, AccountRef("eu", "ACC42"), EventKind.Note(DEMO_NOTE_TEXT), Priority.Routine, [], None
    )
    let restored = decodeJsonText<LedgerEvent>(encodeJsonText(event))
    let text = match (restored.kind) {
        case Note(body) => body
        case _ => throw LedgerException("expected a note")
    }
    @Expect(text, "Stra\u{df}e audit")
    @Expect(text.toRuneArray().size, 12)
    @Expect(encodeJsonBytes(event).size > text.size, true)
}

// ------------------------------------------------------- G. concurrency

/** Serial reference tally used to check the concurrent one. */
func serialTagReport(ledger: EventLedger): Array<String> {
    let counts = HashMap<String, Int64>()
    for (event in ledger.bySequence()) {
        for (tag in event.tags) {
            counts[tag] = (counts.get(tag) ?? 0) + 1
        }
    }
    let lines = ArrayList<String>()
    for (tag in ledger.sortedTags()) {
        lines.add("${tag}=${counts.get(tag) ?? 0}")
    }
    return lines.toArray()
}

@Test
func concurrentTallyMatchesSerialResult(): Unit {
    let ledger = buildDemoLedger()
    let tally = ledger.concurrentTagCounts(4)
    @Expect(tally.isConsistent(), true)
    @Expect(tally.visitedEvents, ledger.size)
    @Expect(
        String.join(tally.report(), delimiter: ","),
        String.join(serialTagReport(ledger), delimiter: ",")
    )
    @Expect(String.join(tally.report(), delimiter: ","), "eu=2,fees=1,payroll=1,rebalance=1")
}

@Test
func concurrentTallyIsIndependentOfShardCount(): Unit {
    let ledger = buildDemoLedger()
    let reference = String.join(serialTagReport(ledger), delimiter: ",")
    for (shards in [1, 2, 3, 4, 7, 16]) {
        let tally = ledger.concurrentTagCounts(shards)
        @Expect(tally.isConsistent(), true)
        @Expect(tally.visitedEvents, ledger.size)
        @Expect(String.join(tally.report(), delimiter: ","), reference)
        @Expect(tally.shardMerged.size, 4)
        @Expect(tally.mutexMerged.size, 4)
    }
}

@Test
func concurrentTallyRejectsNonPositiveShards(): Unit {
    let ledger = buildDemoLedger()
    for (shards in [0, -1]) {
        try {
            ledger.concurrentTagCounts(shards)
            @Fail("a non-positive shard count must be rejected")
        } catch (failure: LedgerException) {
            @Expect(failure.message, "shard count must be positive")
        }
    }
}

@Test
func concurrentTallyHandlesEmptyLedger(): Unit {
    let tally = EventLedger().concurrentTagCounts(4)
    @Expect(tally.visitedEvents, 0)
    @Expect(tally.shardMerged.size, 0)
    @Expect(tally.isConsistent(), true)
    @Expect(tally.report().size, 0)
}

// --------------------------- H. big-endian framing, deflate, SHA-256, hex

@Test
func bigEndianU32RoundTripsMostSignificantByteFirst(): Unit {
    let sink = ByteBuffer()
    writeBigEndianU32(sink, 0x01020304u32)
    let bytes = sink.bytes()
    @Expect(bytes.size, 4)
    @Expect(bytes[0], 1)
    @Expect(bytes[1], 2)
    @Expect(bytes[2], 3)
    @Expect(bytes[3], 4)
    @Expect(readBigEndianU32(bytes, 0), 0x01020304u32)

    for (probe in [0u32, 1u32, 255u32, 256u32, 65535u32, 70000u32, 4294967295u32]) {
        let buffer = ByteBuffer()
        writeBigEndianU32(buffer, probe)
        @Expect(readBigEndianU32(buffer.bytes(), 0), probe)
    }
}

@Test
func bigEndianReadRejectsOutOfRangeOffsets(): Unit {
    let data: Array<Byte> = [0, 0, 0, 7, 9]
    @Expect(readBigEndianU32(data, 0), 7u32)
    @Expect(readBigEndianU32(data, 1), 0x00000709u32)
    for (offset in [2, 5, -1]) {
        try {
            readBigEndianU32(data, offset)
            @Fail("offset ${offset} must be rejected")
        } catch (failure: ArchiveCorruptException) {
            @Expect(failure.reason, "truncated")
        }
    }
}

@Test
func sha256MatchesPublishedVectors(): Unit {
    @Expect(
        sha256Hex("abc".toArray()),
        "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
    )
    @Expect(
        sha256Hex([]),
        "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    )
    @Expect(sha256("abc".toArray()).size, DIGEST_BYTES)
    @Expect(sha256Base64("abc".toArray()), "ungWv48Bz+pBQUDeXa4iI7ADYaOWF3qctBD/YfIAFa0=")
    // Distinct inputs must not collide on this pipeline.
    @Expect(sha256Hex("abc".toArray()) == sha256Hex("abd".toArray()), false)
}

@Test
func hexDigestRoundTripsAndRejectsBadText(): Unit {
    let digest = sha256("abc".toArray())
    @Expect(decodeHexDigest(sha256Hex("abc".toArray())) == digest, true)
    func failure(text: String): String {
        try {
            decodeHexDigest(text)
            return "accepted"
        } catch (problem: ArchiveCorruptException) {
            return problem.reason
        }
    }
    @Expect(failure("abcd"), "digest-length")
    @Expect(failure(""), "digest-length")
    @Expect(failure("zz"), "digest-encoding")
    @Expect(failure("abc"), "digest-encoding")
}

@Test
func deflateRoundTripShrinksAndRestores(): Unit {
    let repetitive = Array<Byte>(4096, repeat: b'A')
    let payload = deflateBytes(repetitive)
    @Expect(payload.size < repetitive.size, true)
    @Expect(inflateBytes(payload, repetitive.size) == repetitive, true)

    let empty = deflateBytes([])
    @Expect(inflateBytes(empty, 0).size, 0)

    let json = encodeJsonBytes(buildDemoLedger().toEnvelope<BatchNote>(Some(demoNote())))
    @Expect(inflateBytes(deflateBytes(json), json.size) == json, true)
}

@Test
func inflateDetectsLengthAndPayloadProblems(): Unit {
    let source = "deterministic".toArray()
    let payload = deflateBytes(source)
    try {
        inflateBytes(payload, source.size + 1)
        @Fail("a wrong expected length must be rejected")
    } catch (failure: ArchiveCorruptException) {
        @Expect(failure.reason, "raw-length")
    }
    try {
        inflateBytes(Array<Byte>(payload.size, repeat: 0), source.size)
        @Fail("an invalid deflate stream must be rejected")
    } catch (failure: ArchiveCorruptException) {
        @Expect(failure.reason, "payload")
    }
}

@Test
func deflateCollectorObeysResourceContract(): Unit {
    let collector = DeflateCollector()
    @Expect(collector.isClosed(), false)
    collector.push("part-one ".toArray())
    collector.push("part-two".toArray())
    let payload = collector.payload()
    // payload() closes the stream so the deflate trailer is complete.
    @Expect(collector.isClosed(), true)
    @Expect(inflateBytes(payload, 17) == "part-one part-two".toArray(), true)
    // close() is idempotent and payload() stays stable.
    collector.close()
    @Expect(collector.isClosed(), true)
    @Expect(collector.payload() == payload, true)
    try {
        collector.push("late".toArray())
        @Fail("pushing after close must be rejected")
    } catch (failure: LedgerException) {
        @Expect(failure.message, "collector already closed")
    }
}

@Test
func tryWithResourceClosesCollectorOnThrow(): Unit {
    let collector = DeflateCollector()
    try (guarded = collector) {
        guarded.push("data".toArray())
        throw LedgerException("abort")
    } catch (failure: LedgerException) {
        @Expect(failure.message, "abort")
    }
    @Expect(collector.isClosed(), true)
}

// ------------------- I. frame layout, corruption detection, file storage

@Test
func frameLayoutIsSelfDescribing(): Unit {
    let raw = encodeJsonBytes(buildDemoLedger().toEnvelope<BatchNote>(Some(demoNote())))
    let frame = encodeFrame(raw)
    @Expect(String.fromUtf8(frame[..4]), ARCHIVE_MAGIC)
    @Expect(HEADER_BYTES, 12)
    @Expect(DIGEST_BYTES, 32)

    let header = readHeader(frame)
    @Expect(header.rawLength, raw.size)
    @Expect(Int64(readBigEndianU32(frame, 4)), raw.size)
    @Expect(Int64(readBigEndianU32(frame, 8)), header.payloadLength)
    @Expect(frame.size, HEADER_BYTES + header.payloadLength + DIGEST_BYTES)
    // The trailer certifies the uncompressed JSON, not the payload.
    @Expect(frame[(frame.size - DIGEST_BYTES)..] == sha256(raw), true)
    @Expect(header.payloadLength < header.rawLength, true)
    @Expect(decodeFrame(frame) == raw, true)
    @Expect(header, ArchiveHeader(raw.size, header.payloadLength))
}

@Test
func intactFrameClassifiesAsOk(): Unit {
    @Expect(classifyFrame(demoFrame()), "ok")
    @Expect(classifyFrame(encodeFrame([])), "ok")
    @Expect(decodeFrame(encodeFrame([])).size, 0)
}

@Test
func corruptMagicIsDetected(): Unit {
    let damaged = demoFrame()
    damaged[0] = b'X'
    @Expect(classifyFrame(damaged), "magic")
    let shifted = demoFrame()
    shifted[3] = b'2'
    @Expect(classifyFrame(shifted), "magic")
}

@Test
func truncatedFrameIsDetected(): Unit {
    let frame = demoFrame()
    @Expect(classifyFrame([]), "truncated")
    @Expect(classifyFrame(frame[..(HEADER_BYTES + DIGEST_BYTES - 1)]), "truncated")
    @Expect(classifyFrame(frame[..HEADER_BYTES]), "truncated")
    // Long enough to hold a header, but the declared payload no longer fits.
    @Expect(classifyFrame(frame[..(frame.size - 1)]), "payload-length")
}

@Test
func tamperedPayloadIsDetected(): Unit {
    // An all-zero body is not a valid raw-deflate stream.
    let zeroed = demoFrame()
    for (index in HEADER_BYTES..(zeroed.size - DIGEST_BYTES)) {
        zeroed[index] = 0
    }
    @Expect(classifyFrame(zeroed), "payload")
}

@Test
func tamperedRawLengthIsDetected(): Unit {
    let damaged = demoFrame()
    damaged[7] = damaged[7] ^ 0x01
    @Expect(classifyFrame(damaged), "raw-length")
}

@Test
func tamperedDigestIsDetected(): Unit {
    let damaged = demoFrame()
    damaged[damaged.size - 1] = damaged[damaged.size - 1] ^ 0x01
    @Expect(classifyFrame(damaged), "digest")
    let firstByte = demoFrame()
    firstByte[firstByte.size - DIGEST_BYTES] = firstByte[firstByte.size - DIGEST_BYTES] ^ 0x80
    @Expect(classifyFrame(firstByte), "digest")
}

@Test
func archiveEnvelopeSurvivesTheFullPipeline(): Unit {
    let ledger = buildDemoLedger()
    let envelope = ledger.toEnvelope<BatchNote>(Some(demoNote()))
    let frame = encodeArchive<BatchNote>(envelope)
    let restored = decodeArchive<BatchNote>(frame)
    @Expect(restored.schema, ENVELOPE_SCHEMA)
    @Expect(restored.events.size, 4)
    @Expect(restored.annotation.getOrThrow().author, "oracle")
    @Expect(encodeJsonBytes(restored) == encodeJsonBytes(envelope), true)

    let rebuilt = EventLedger.fromEnvelope<BatchNote>(restored)
    @Expect(rebuilt.size, ledger.size)
    @Expect(String.join(rebuilt.balanceReport(), delimiter: " "),
        String.join(ledger.balanceReport(), delimiter: " "))
    @Expect(String.join(rebuilt.sortedTags(), delimiter: ","),
        String.join(ledger.sortedTags(), delimiter: ","))
    // Encoding is byte-stable, so the whole frame reproduces exactly.
    @Expect(encodeArchive<BatchNote>(envelope) == frame, true)
}

@Test
func saveAndLoadArchiveThroughTheFileSystem(): Unit {
    let path = "event-ledger-test-roundtrip.ela"
    removeIfExists(path)
    let ledger = buildDemoLedger()
    let envelope = ledger.toEnvelope<BatchNote>(Some(demoNote()))
    try {
        let digest = saveArchive<BatchNote>(path, envelope)
        @Expect(exists(path), true)
        @Expect(digest, sha256Hex(encodeJsonBytes(envelope)))
        @Expect(digest.size, DIGEST_BYTES * 2)

        let reloaded = loadArchive<BatchNote>(path)
        @Expect(reloaded.events.size, 4)
        @Expect(reloaded.annotation.getOrThrow().comment, "deterministic demo batch")
        @Expect(encodeJsonBytes(reloaded) == encodeJsonBytes(envelope), true)
        // Overwriting is safe and reproduces the same digest.
        @Expect(saveArchive<BatchNote>(path, envelope), digest)
    } finally {
        removeIfExists(path)
    }
    @Expect(exists(path), false)
}

@Test
func loadArchiveRejectsCorruptFileCase(): Unit {
    let path = "event-ledger-test-corrupt.ela"
    removeIfExists(path)
    let envelope = buildDemoLedger().toEnvelope<BatchNote>(Some(demoNote()))
    try {
        saveArchive<BatchNote>(path, envelope)
        let damaged = File.readFrom(Path(path))
        damaged[damaged.size - 1] = damaged[damaged.size - 1] ^ 0x01
        File.writeTo(Path(path), damaged)
        try {
            loadArchive<BatchNote>(path)
            @Fail("a corrupt archive file must be rejected")
        } catch (failure: ArchiveCorruptException) {
            @Expect(failure.reason, "digest")
            @Expect(failure.message, "archive corrupt: digest")
        }
    } finally {
        removeIfExists(path)
    }
    @Expect(exists(path), false)
}

// ------------------------------------------- J. end-to-end determinism

@Test
func demoLedgerHoldsTheFixedFacts(): Unit {
    let ledger = buildDemoLedger()
    @Expect(ledger.size, 4)
    let events = ledger.bySequence()
    @Expect(events[0].account == AccountRef("eu", "ACC42"), true)
    // The seq-1 amount 120.505 is rounded half-even to 120.50 on the way in.
    @Expect(events[0].kind.toString(), "credit(120.50)")
    @Expect(String.join(events[0].tags, delimiter: ","), "eu,payroll")
    @Expect(events[1].kind.toString(), "debit(20.25)")
    @Expect(events[1].memo.isNone(), true)
    @Expect(events[2].kind.toString(), "transfer(eu:ACC42,5.00)")
    @Expect(events[2].priority == Priority.Urgent, true)
    @Expect(events[3].kind.toString(), "note(Stra\u{df}e audit)")
    @Expect(String.join(ledger.balanceReport(), delimiter: " "), "eu:ACC42=100.25 us:ACC7=-5.00")
}

@Test
func demoReportIsStableAcrossRuns(): Unit {
    let first = demoReport()
    let second = demoReport()
    @Expect(first.size, second.size)
    @Expect(String.join(first, delimiter: "\n"), String.join(second, delimiter: "\n"))
    @Expect(first[0], "events=4")
    @Expect(lineStartingWith(first, "tags="), "tags=eu,fees,payroll,rebalance")
    @Expect(lineStartingWith(first, "net="), "net=95.25")
    @Expect(lineStartingWith(first, "kinds="), "kinds=credit:1|debit:1|note:1|transfer:1")
    @Expect(lineStartingWith(first, "gross="), "gross=14575")
    @Expect(lineStartingWith(first, "tally consistent="), "tally consistent=true visited=4")
    @Expect(lineStartingWith(first, "restored events="), "restored events=4 identical=true")
    @Expect(lineStartingWith(first, "damage intact="), "damage intact=ok")
    @Expect(lineStartingWith(first, "damage magic="), "damage magic=magic")
    @Expect(lineStartingWith(first, "damage digest="), "damage digest=digest")
}

@Test
func demoReportLeavesNoFileBehind(): Unit {
    // The demo writes and removes its archive, so the run has no side effects.
    demoReport()
    @Expect(exists("event-ledger-demo.ela"), false)
}
