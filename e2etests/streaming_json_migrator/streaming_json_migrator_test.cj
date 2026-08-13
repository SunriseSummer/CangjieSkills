package streaming_json_migrator

private func expectMigrationError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected JsonMigrationException")
    } catch (_: JsonMigrationException) {
        @Assert(true)
    }
}

@Test
class TestDecode {
    @TestCase
    func decodesCurrentFields() {
        let r = JsonRecordMigrator.decode(
            ##"{"id":1,"name":"A","active":false,"note":"n","tags":["x","y"]}"##)
        @Assert(r.id, 1)
        @Assert(r.name, "A")
        @Assert(r.active, false)
        @Assert(r.note, Some("n"))
        @Assert(r.tags, ["x", "y"])
    }

    @TestCase
    func decodesLegacyAliases() {
        let r = JsonRecordMigrator.decode(
            ##"{"user_id":2,"display_name":"B","enabled":false}"##)
        @Assert(r.id, 2)
        @Assert(r.name, "B")
        @Assert(r.active, false)
    }

    @TestCase
    func usesDefaults() {
        let r = JsonRecordMigrator.decode(##"{"id":3,"name":"C"}"##)
        @Assert(r.active, true)
        @Assert(r.note, None)
        @Assert(r.tags.size, 0)
    }

    @TestCase
    func readsNullNote() {
        @Assert(JsonRecordMigrator.decode(
            ##"{"id":4,"name":"D","note":null}"##).note, None)
    }

    @TestCase
    func lastDuplicateWins() {
        let r = JsonRecordMigrator.decode(
            ##"{"id":1,"user_id":9,"name":"old","display_name":"new"}"##)
        @Assert(r.id, 9)
        @Assert(r.name, "new")
    }

    @TestCase
    func skipsUnknownScalar() {
        let r = JsonRecordMigrator.decode(
            ##"{"unknown":123,"id":5,"name":"E"}"##)
        @Assert(r.id, 5)
    }

    @TestCase
    func skipsUnknownArray() {
        let r = JsonRecordMigrator.decode(
            ##"{"id":6,"unknown":[1,{"x":2},3],"name":"F"}"##)
        @Assert(r.name, "F")
    }

    @TestCase
    func skipsUnknownNestedObject() {
        let r = JsonRecordMigrator.decode(
            ##"{"unknown":{"a":{"b":[true,null]}},"name":"G","id":7}"##)
        @Assert(r.id, 7)
        @Assert(r.name, "G")
    }

    @TestCase
    func preservesUnicodeAndEscapes() {
        let r = JsonRecordMigrator.decode(
            ##"{"id":8,"name":"仓颉\n语言","tags":["你好","\\"]}"##)
        @Assert(r.name, "仓颉\n语言")
        @Assert(r.tags, ["你好", "\\"])
    }

    @TestCase
    func rejectsMissingId() {
        expectMigrationError { => JsonRecordMigrator.decode(##"{"name":"A"}"##) }
    }

    @TestCase
    func rejectsMissingName() {
        expectMigrationError { => JsonRecordMigrator.decode(##"{"id":1}"##) }
    }

    @TestCase
    func rejectsNegativeId() {
        expectMigrationError { => JsonRecordMigrator.decode(##"{"id":-1,"name":"A"}"##) }
    }

    @TestCase
    func rejectsEmptyName() {
        expectMigrationError { => JsonRecordMigrator.decode(##"{"id":1,"name":""}"##) }
    }
}

@Test
class TestEncodeAndMigrate {
    @TestCase
    func compactOrderIsStable() {
        let s = JsonRecordMigrator.encode(UserRecord(1, "A"))
        @Assert(s, ##"{"id":1,"name":"A","active":true,"note":null,"tags":[]}"##)
    }

    @TestCase
    func writesSomeNoteAndTags() {
        let s = JsonRecordMigrator.encode(
            UserRecord(2, "B", active: false, note: Some("n"), tags: ["x", "y"]))
        @Assert(s, ##"{"id":2,"name":"B","active":false,"note":"n","tags":["x","y"]}"##)
    }

    @TestCase
    func migratesAliasesToCurrentNames() {
        let s = JsonRecordMigrator.migrate(
            ##"{"user_id":3,"display_name":"C","enabled":false}"##)
        @Assert(s, ##"{"id":3,"name":"C","active":false,"note":null,"tags":[]}"##)
    }

    @TestCase
    func migrationDropsUnknownFields() {
        let s = JsonRecordMigrator.migrate(
            ##"{"id":4,"unknown":{"x":1},"name":"D"}"##)
        @Assert(s, ##"{"id":4,"name":"D","active":true,"note":null,"tags":[]}"##)
    }

    @TestCase
    func prettyOutputHasNewlines() {
        let s = JsonRecordMigrator.encode(UserRecord(5, "E"), pretty: true)
        @Assert(s.contains("\n"), true)
        @Assert(JsonRecordMigrator.decode(s).id, 5)
    }

    @TestCase
    func htmlSafeEscapesHtmlCharacters() {
        let s = JsonRecordMigrator.encode(UserRecord(6, "<a&b>"), htmlSafe: true)
        @Assert(s.contains("<"), false)
        @Assert(s.contains(">"), false)
        @Assert(s.contains("&"), false)
        @Assert(JsonRecordMigrator.decode(s).name, "<a&b>")
    }

    @TestCase
    func compactEncodingIsRepeatable() {
        let r = UserRecord(7, "G", note: Some("same"), tags: ["a"])
        @Assert(JsonRecordMigrator.encode(r), JsonRecordMigrator.encode(r))
    }

    @TestCase
    func migrateIsIdempotent() {
        let once = JsonRecordMigrator.migrate(##"{"user_id":8,"display_name":"H"}"##)
        @Assert(JsonRecordMigrator.migrate(once), once)
    }
}

@Test
class TestRawExtraction {
    @TestCase
    func extractsScalarRawBytes() {
        let raw = JsonRecordMigrator.extractRawField(
            ##"{"a":1,"target":-12.50,"z":2}"##, "target")
        @Assert(String.fromUtf8(raw.getOrThrow()), "-12.50")
    }

    @TestCase
    func extractsStringWithOriginalEscapes() {
        let raw = JsonRecordMigrator.extractRawField(
            ##"{"target":"a\n\\b"}"##, "target")
        @Assert(String.fromUtf8(raw.getOrThrow()), ##""a\n\\b""##)
    }

    @TestCase
    func extractsNestedRawValue() {
        let raw = JsonRecordMigrator.extractRawField(
            ##"{"skip":[0],"target":{"a":[1,true,null]}}"##, "target")
        @Assert(String.fromUtf8(raw.getOrThrow()), ##"{"a":[1,true,null]}"##)
    }

    @TestCase
    func missingFieldReturnsNone() {
        @Assert(JsonRecordMigrator.extractRawField(
            ##"{"a":{"deep":1}}"##, "target"), None)
    }
}
