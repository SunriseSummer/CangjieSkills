package exact_share_allocator

import std.math.*
import std.math.numeric.*

private func expectAllocationError(action: () -> Unit): Unit {
    try { action(); @Fail("expected AllocationException") } catch (_: AllocationException) { @Assert(true) }
}

@Test
class TestMinorUnits {
    @TestCase func integerAtScaleTwo() { @Assert(toMinorUnits("12", 2), BigInt(1200)) }
    @TestCase func preservesTrailingZeros() { @Assert(toMinorUnits("12.3400", 2), BigInt(1234)) }
    @TestCase func negativeAmount() { @Assert(toMinorUnits("-2.50", 2), BigInt(-250)) }
    @TestCase func scientificNotation() { @Assert(toMinorUnits("1.2e3", 2), BigInt(120000)) }
    @TestCase func halfEvenRoundsDownToEven() { @Assert(toMinorUnits("12.345", 2), BigInt(1234)) }
    @TestCase func halfEvenRoundsUpToEven() { @Assert(toMinorUnits("12.355", 2), BigInt(1236)) }
    @TestCase func halfUpRoundsTieAway() { @Assert(toMinorUnits("12.345", 2, mode: RoundingMode.HalfUp), BigInt(1235)) }
    @TestCase func ceilingForNegative() { @Assert(toMinorUnits("-1.231", 2, mode: RoundingMode.Ceiling), BigInt(-123)) }
    @TestCase func floorForNegative() { @Assert(toMinorUnits("-1.231", 2, mode: RoundingMode.Floor), BigInt(-124)) }
    @TestCase func scaleZero() { @Assert(toMinorUnits("9.6", 0), BigInt(10)) }
    @TestCase func rejectsInvalidDecimal() { expectAllocationError { => toMinorUnits("12x", 2) } }
    @TestCase func rejectsNegativeScale() { expectAllocationError { => toMinorUnits("1", -1) } }
    @TestCase func rejectsExcessiveScale() { expectAllocationError { => toMinorUnits("1", 19) } }
}

@Test
class TestAllocation {
    @TestCase func oneWeightGetsAll() { @Assert(allocate(BigInt(17), [BigInt(9)]), [BigInt(17)]) }
    @TestCase func equalWeightsUseStableTie() { @Assert(allocate(BigInt(10), [BigInt(1), BigInt(1), BigInt(1)]), [BigInt(4), BigInt(3), BigInt(3)]) }
    @TestCase func proportionalRemainders() { @Assert(allocate(BigInt(5), [BigInt(1), BigInt(2)]), [BigInt(2), BigInt(3)]) }
    @TestCase func zeroWeightGetsZero() { @Assert(allocate(BigInt(7), [BigInt(0), BigInt(2), BigInt(1)]), [BigInt(0), BigInt(5), BigInt(2)]) }
    @TestCase func zeroTotal() { @Assert(allocate(BigInt(0), [BigInt(1), BigInt(2)]), [BigInt(0), BigInt(0)]) }
    @TestCase func hugeBigIntStaysExact() { let total = BigInt.parse("1000000000000000000000000000001"); let parts = allocate(total, [BigInt(1), BigInt(1)]); @Assert(parts[0] + parts[1], total); @Assert(parts[0] - parts[1], BigInt(1)) }
    @TestCase func rejectsEmptyWeights() { expectAllocationError { => allocate(BigInt(1), []) } }
    @TestCase func rejectsAllZeroWeights() { expectAllocationError { => allocate(BigInt(1), [BigInt(0), BigInt(0)]) } }
    @TestCase func rejectsNegativeWeight() { expectAllocationError { => allocate(BigInt(1), [BigInt(1), BigInt(-1)]) } }
    @TestCase func rejectsNegativeTotal() { expectAllocationError { => allocate(BigInt(-1), [BigInt(1)]) } }
}

@Test
class TestOverflowAndDerivedKey {
    @TestCase func normalOverflowProfile() { let p = overflowProfile(10, 20); @Assert(p.checked, Some(30)); @Assert(p.saturated, 30); @Assert(p.wrapped, 30); @Assert(!p.truncated); @Assert(p.carryingValue, 30) }
    @TestCase func positiveOverflowProfile() { let p = overflowProfile(Int64.Max, 1); @Assert(p.checked, None); @Assert(p.saturated, Int64.Max); @Assert(p.wrapped, Int64.Min); @Assert(p.truncated); @Assert(p.carryingValue, Int64.Min) }
    @TestCase func negativeOverflowProfile() { let p = overflowProfile(Int64.Min, -1); @Assert(p.checked, None); @Assert(p.saturated, Int64.Min); @Assert(p.wrapped, Int64.Max); @Assert(p.truncated); @Assert(p.carryingValue, Int64.Max) }
    @TestCase func derivedEquality() { @Assert(AllocationKey("acct", 1), AllocationKey("acct", 1)) }
    @TestCase func derivedInequality() { @Assert(AllocationKey("acct", 1) != AllocationKey("acct", 2)) }
    @TestCase func derivedHashIsStable() { @Assert(AllocationKey("acct", 1).hashCode(), AllocationKey("acct", 1).hashCode()) }
    @TestCase func derivedToString() { @Assert(AllocationKey("acct", 1).toString(), "AllocationKey(account: acct, bucket: 1)") }
    @TestCase func aggregatesEqualDerivedKeys() { let k1 = AllocationKey("acct", 1); let k2 = AllocationKey("acct", 2); let sums = sumByKey([AllocationEntry(k1, BigInt(10)), AllocationEntry(AllocationKey("acct", 1), BigInt(7)), AllocationEntry(k2, BigInt(3))]); @Assert(sums.size, 2); @Assert(sums[k1], BigInt(17)); @Assert(sums[k2], BigInt(3)) }
}
