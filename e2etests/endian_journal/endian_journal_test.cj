package endian_journal

private func expectJournalError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected JournalException")
    } catch (_: JournalException) {
        @Assert(true)
    }
}

private func fixture(): Array<TelemetryRecord> {
    [
        TelemetryRecord(0x01020304u32, 0x0102030405060708, 12.5, 0x1122u16),
        TelemetryRecord(7u32, -2, -0.25, 3u16)
    ]
}

@Test
class EndianJournalTests {
    @TestCase func reportsFixedSizes() { @Assert(JournalCodec.headerSize(), 5); @Assert(JournalCodec.recordSize(), 22); @Assert(JournalCodec.encodedSize(2), 49) }
    @TestCase func rejectsNegativeCount() { expectJournalError { => JournalCodec.encodedSize(-1) } }
    @TestCase func rejectsTooManyRecords() { expectJournalError { => JournalCodec.encodedSize(65536) } }
    @TestCase func emptyRoundTrip() { @Assert(JournalCodec.decode(JournalCodec.encode([])).size, 0) }
    @TestCase func roundTripPreservesAllFields() { let rows = JournalCodec.decode(JournalCodec.encode(fixture())); @Assert(rows.size, 2); @Assert(rows[0].sensorId, 0x01020304u32); @Assert(rows[0].sequence, 0x0102030405060708); @Assert(rows[0].reading, 12.5); @Assert(rows[0].flags, 0x1122u16); @Assert(rows[1].sequence, -2); @Assert(rows[1].reading, -0.25) }
    @TestCase func headerUsesBigEndianCount() { let frame = JournalCodec.encode(fixture()); @Assert(frame.slice(0, 5), [b'T', b'J', 1, 0, 2]) }
    @TestCase func recordUsesSpecifiedEndianness() { let frame = JournalCodec.encode([fixture()[0]]); let sensor: Array<Byte> = [4, 3, 2, 1]; let sequence: Array<Byte> = [1, 2, 3, 4, 5, 6, 7, 8]; let flags: Array<Byte> = [0x11, 0x22]; @Assert(frame.slice(5, 4), sensor); @Assert(frame.slice(9, 8), sequence); @Assert(frame.slice(25, 2), flags) }
    @TestCase func encodingIsDeterministic() { @Assert(JournalCodec.encode(fixture()), JournalCodec.encode(fixture())) }
    @TestCase func throughBufferCopies() { let source: Array<Byte> = [1, 2, 3]; let copied = JournalCodec.throughBuffer(source); @Assert(copied, source); copied[0] = 9; @Assert(source[0], 1) }
    @TestCase func rejectsShortFrame() { expectJournalError { => JournalCodec.decode([b'T']) } }
    @TestCase func rejectsBadMagic() { let frame = JournalCodec.encode(fixture()); frame[0] = b'X'; expectJournalError { => JournalCodec.decode(frame) } }
    @TestCase func rejectsBadVersion() { let frame = JournalCodec.encode(fixture()); frame[2] = 2; expectJournalError { => JournalCodec.decode(frame) } }
    @TestCase func rejectsTruncatedRecord() { let frame = JournalCodec.encode(fixture()); expectJournalError { => JournalCodec.decode(frame.slice(0, frame.size - 1)) } }
    @TestCase func rejectsTrailingData() { let frame = JournalCodec.encode([]); let extended = Array<Byte>(frame.size + 1, repeat: 0); frame.copyTo(extended, 0, 0, frame.size); expectJournalError { => JournalCodec.decode(extended) } }
}
