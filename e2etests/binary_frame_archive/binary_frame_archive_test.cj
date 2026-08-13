package binary_frame_archive

import std.binary.*
import std.crypto.digest.*
import std.fs.*
import stdx.crypto.digest.*

private func fixture(): Array<ArchiveEntry> {
    [
        ArchiveEntry("a.txt", "alpha".toArray()),
        ArchiveEntry("数据.bin", [0, 1, 2, 255])
    ]
}

private func expectArchiveError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected ArchiveException")
    } catch (_: ArchiveException) {
        @Assert(true)
    }
}

@Test
class TestPrimitives {
    @TestCase
    func headerSizeIsFixed() {
        @Assert(FrameArchive.headerSize(), 48)
    }

    @TestCase
    func checkedBudgetAddsAllParts() {
        @Assert(FrameArchive.checkedStorageBudget(10, 7), 65)
    }

    @TestCase
    func checkedBudgetRejectsNegative() {
        expectArchiveError { => FrameArchive.checkedStorageBudget(-1, 0) }
    }

    @TestCase
    func checkedBudgetRejectsOverflow() {
        expectArchiveError { => FrameArchive.checkedStorageBudget(Int64.Max, 1) }
    }

    @TestCase
    func sha256KnownVector() {
        @Assert(FrameArchive.sha256Hex("abc".toArray()),
            "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")
    }

    @TestCase
    func sha256EmptyVector() {
        @Assert(FrameArchive.sha256Hex([]),
            "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
    }

    @TestCase
    func hexRoundTrip() {
        let bytes: Array<Byte> = [0, 1, 15, 16, 255]
        @Assert(FrameArchive.frameToHex(bytes), "00010f10ff")
        @Assert(FrameArchive.frameFromHex("00010F10fF"), bytes)
    }

    @TestCase
    func rejectsOddHex() {
        expectArchiveError { => FrameArchive.frameFromHex("abc") }
    }

    @TestCase
    func rejectsNonHex() {
        expectArchiveError { => FrameArchive.frameFromHex("zz") }
    }
}

@Test
class TestEncodingRoundTrip {
    @TestCase
    func emptyRawArchive() {
        let decoded = FrameArchive.decode(FrameArchive.encode([], compress: false))
        @Assert(decoded.size, 0)
    }

    @TestCase
    func emptyCompressedArchive() {
        let decoded = FrameArchive.decode(FrameArchive.encode([], compress: true))
        @Assert(decoded.size, 0)
    }

    @TestCase
    func singleEntryRoundTrip() {
        let entries = [ArchiveEntry("hello.txt", "hello".toArray())]
        let decoded = FrameArchive.decode(FrameArchive.encode(entries, compress: false))
        @Assert(decoded.size, 1)
        @Assert(decoded[0].name, "hello.txt")
        @Assert(decoded[0].data, "hello".toArray())
    }

    @TestCase
    func multipleEntriesPreserveOrder() {
        let decoded = FrameArchive.decode(FrameArchive.encode(fixture()))
        @Assert(decoded.size, 2)
        @Assert(decoded[0].name, "a.txt")
        @Assert(decoded[1].name, "数据.bin")
    }

    @TestCase
    func acceptsEmptyEntryData() {
        let decoded = FrameArchive.decode(
            FrameArchive.encode([ArchiveEntry("empty", [])], compress: false))
        @Assert(decoded[0].data.size, 0)
    }

    @TestCase
    func unicodeNameAndData() {
        let entries = [ArchiveEntry("目录/你好.txt", "仓颉".toArray())]
        let decoded = FrameArchive.decode(FrameArchive.encode(entries))
        @Assert(decoded[0].name, "目录/你好.txt")
        @Assert(String.fromUtf8(decoded[0].data), "仓颉")
    }

    @TestCase
    func duplicateNamesArePreserved() {
        let entries = [ArchiveEntry("same", [1]), ArchiveEntry("same", [2])]
        let decoded = FrameArchive.decode(FrameArchive.encode(entries, compress: false))
        @Assert(decoded[0].name, "same")
        @Assert(decoded[1].name, "same")
        let one: Array<Byte> = [1]
        let two: Array<Byte> = [2]
        @Assert(decoded[0].data, one)
        @Assert(decoded[1].data, two)
    }

    @TestCase
    func rawEncodingIsDeterministic() {
        @Assert(FrameArchive.encode(fixture(), compress: false),
            FrameArchive.encode(fixture(), compress: false))
    }

    @TestCase
    func compressedEncodingIsDeterministic() {
        @Assert(FrameArchive.encode(fixture()), FrameArchive.encode(fixture()))
    }

    @TestCase
    func compressionShrinksRepeatedPayload() {
        let repeated = Array<Byte>(4096, repeat: b'A')
        let entries = [ArchiveEntry("repeat.bin", repeated)]
        @Assert(FrameArchive.encode(entries).size <
            FrameArchive.encode(entries, compress: false).size)
    }

    @TestCase
    func writesHeaderEndianness() {
        let frame = FrameArchive.encode(fixture(), compress: false)
        @Assert(frame.slice(0, 4), "CJAR".toArray())
        @Assert(frame[4], 1)
        @Assert(frame[5], 0)
        @Assert(UInt16.readBigEndian(frame.slice(6, 2)), 2u16)
        let rawLength = UInt32.readBigEndian(frame.slice(8, 4)).position()
        let storedLength = UInt32.readLittleEndian(frame.slice(12, 4)).position()
        @Assert(rawLength, storedLength)
        @Assert(frame.size, 48 + storedLength)
    }

    @TestCase
    func doesNotMutateEntryData() {
        let data: Array<Byte> = [9, 8, 7]
        let before = data.clone()
        FrameArchive.encode([ArchiveEntry("x", data)])
        @Assert(data, before)
    }

    @TestCase
    func rejectsEmptyName() {
        expectArchiveError { =>
            FrameArchive.encode([ArchiveEntry("", [1])], compress: false)
        }
    }
}

@Test
class TestCorruptionAndIo {
    @TestCase
    func rejectsShortFrame() {
        expectArchiveError { => FrameArchive.decode([1, 2, 3]) }
    }

    @TestCase
    func rejectsBadMagic() {
        let bad = FrameArchive.encode(fixture(), compress: false)
        bad[0] = b'X'
        expectArchiveError { => FrameArchive.decode(bad) }
    }

    @TestCase
    func rejectsVersion() {
        let bad = FrameArchive.encode(fixture(), compress: false)
        bad[4] = 2
        expectArchiveError { => FrameArchive.decode(bad) }
    }

    @TestCase
    func rejectsUnknownFlags() {
        let bad = FrameArchive.encode(fixture(), compress: false)
        bad[5] = 2
        expectArchiveError { => FrameArchive.decode(bad) }
    }

    @TestCase
    func rejectsStoredLengthMismatch() {
        let bad = FrameArchive.encode(fixture(), compress: false)
        bad[12] = bad[12] + 1
        expectArchiveError { => FrameArchive.decode(bad) }
    }

    @TestCase
    func rejectsRawLengthMismatch() {
        let bad = FrameArchive.encode(fixture(), compress: false)
        bad[11] = bad[11] + 1
        expectArchiveError { => FrameArchive.decode(bad) }
    }

    @TestCase
    func rejectsDigestMismatch() {
        let bad = FrameArchive.encode(fixture(), compress: false)
        bad[16] = bad[16] ^ 1
        expectArchiveError { => FrameArchive.decode(bad) }
    }

    @TestCase
    func rejectsEntryCountMismatch() {
        let bad = FrameArchive.encode(fixture(), compress: false)
        bad[7] = 3
        expectArchiveError { => FrameArchive.decode(bad) }
    }

    @TestCase
    func rejectsTrailingPayloadForZeroCount() {
        let bad = FrameArchive.encode(fixture(), compress: false)
        bad[6] = 0
        bad[7] = 0
        expectArchiveError { => FrameArchive.decode(bad) }
    }

    @TestCase
    func rejectsInvalidUtf8Name() {
        let bad = FrameArchive.encode([ArchiveEntry("x", [1])], compress: false)
        bad[54] = 255
        let checksum = digest<SHA256>(SHA256(), bad.slice(48, bad.size - 48))
        for (i in 0..32) { bad[16 + i] = checksum[i] }
        expectArchiveError { => FrameArchive.decode(bad) }
    }

    @TestCase
    func fileRoundTrip() {
        let path = Path("./.binary_frame_archive_test.cjar")
        removeIfExists(path)
        try {
            FrameArchive.writeFile(path.toString(), fixture())
            let decoded = FrameArchive.readFile(path.toString())
            @Assert(decoded.size, 2)
            @Assert(decoded[0].data, "alpha".toArray())
        } finally {
            removeIfExists(path)
        }
    }

    @TestCase
    func missingFileIsWrapped() {
        let path = Path("./.binary_frame_archive_missing.cjar")
        removeIfExists(path)
        expectArchiveError { => FrameArchive.readFile(path.toString()) }
    }
}
