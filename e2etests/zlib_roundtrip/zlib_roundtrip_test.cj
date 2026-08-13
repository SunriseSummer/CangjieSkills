package zlib_roundtrip

import std.unittest.*
import std.unittest.testmacro.*

private func assertRoundTrip(source: Array<Byte>): Unit {
    @Assert(decompressBytes(compressBytes(source)) == source)
}

@Test
class ZlibRoundTripTests {
    @TestCase
    func emptyData(): Unit {
        assertRoundTrip(Array<Byte>())
    }

    @TestCase
    func shortText(): Unit {
        assertRoundTrip("Cangjie zlib round trip".toArray())
    }

    @TestCase
    func repeatedData(): Unit {
        let source = Array<Byte>(16384, repeat: b'A')
        let compressed = compressBytes(source)
        @Assert(compressed.size < source.size)
        @Assert(decompressBytes(compressed) == source)
    }

    @TestCase
    func everyByteValue(): Unit {
        let source = Array<Byte>(256, {index => UInt8(index)})
        assertRoundTrip(source)
    }
}
