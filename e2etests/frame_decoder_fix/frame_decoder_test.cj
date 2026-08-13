package frame_decoder_fix

import std.collection.*

private func expectFrameError(action: () -> Unit): Unit { try { action(); @Fail("expected FrameException") } catch (_: FrameException) { @Assert(true) } }

private func corrupt(bytes: Array<UInt8>, index: Int64): Array<UInt8> { let copy = bytes.clone(); copy[index] = copy[index] ^ 0x01; copy }
private func concat(left: Array<UInt8>, right: Array<UInt8>): Array<UInt8> { let result = ArrayList<UInt8>(); result.add(all: left); result.add(all: right); result.toArray() }

@Test
class FrameDecoderTests {
    @TestCase func encodeDecodeRoundTrip() { let input = Frame(3, 42, [1, 2, 3]); let d = FrameDecoder(100); let out = d.feed(encode(input)); @Assert(out.size, 1); @Assert(out[0].flags, 3); @Assert(out[0].sequence, 42); let expected: Array<UInt8> = [1, 2, 3]; @Assert(out[0].payload, expected); @Assert(d.bufferedBytes(), 0) }
    @TestCase func supportsEmptyPayload() { let d = FrameDecoder(0); let out = d.feed(encode(Frame(0, -1, []))); @Assert(out.size, 1); @Assert(out[0].payload.size, 0) }
    @TestCase func acceptsEverySplitPoint() { let bytes = encode(Frame(7, 123456789, [9, 8, 7, 6])); for (split in 0..bytes.size) { let d = FrameDecoder(100); let a = d.feed(bytes[0..split]); let b = d.feed(bytes[split..bytes.size]); @Assert(a.size + b.size, 1); @Assert(d.bufferedBytes(), 0) } }
    @TestCase func decodesMultipleFrames() { let a = encode(Frame(1, 1, [1])); let b = encode(Frame(2, 2, [2, 3])); let d = FrameDecoder(10); let out = d.feed(concat(a, b)); @Assert(out.size, 2); @Assert(out[0].sequence, 1); @Assert(out[1].sequence, 2) }
    @TestCase func retainsPartialData() { let bytes = encode(Frame(1, 5, [1, 2, 3])); let d = FrameDecoder(10); @Assert(d.feed(bytes[0..5]).size, 0); @Assert(d.bufferedBytes(), 5); @Assert(d.feed(bytes[5..bytes.size]).size, 1); @Assert(d.bufferedBytes(), 0) }
    @TestCase func emptyFeedIsNoOp() { let d = FrameDecoder(10); @Assert(d.feed([]).size, 0); @Assert(d.bufferedBytes(), 0) }
    @TestCase func payloadIsIndependent() { let source: Array<UInt8> = [1, 2, 3]; let bytes = encode(Frame(0, 1, source)); source[0] = 9; let d = FrameDecoder(10); let out = d.feed(bytes); let expected: Array<UInt8> = [1, 2, 3]; @Assert(out[0].payload, expected); let payload = out[0].payload; payload[0] = 7; @Assert(out[0].payload[0], 7) }
    @TestCase func rejectsBadMagicAndRecovers() { let d = FrameDecoder(10); expectFrameError { => d.feed(corrupt(encode(Frame(0, 1, [])), 0)); () }; @Assert(d.bufferedBytes(), 0); @Assert(d.feed(encode(Frame(0, 2, [])))[0].sequence, 2) }
    @TestCase func rejectsBadVersionAndRecovers() { let d = FrameDecoder(10); expectFrameError { => d.feed(corrupt(encode(Frame(0, 1, [])), 2)); () }; @Assert(d.bufferedBytes(), 0); @Assert(d.feed(encode(Frame(0, 2, []))).size, 1) }
    @TestCase func rejectsOversizedLengthBeforePayload() { let bytes = encode(Frame(0, 1, [1, 2, 3])); let d = FrameDecoder(2); expectFrameError { => d.feed(bytes[0..16]); () }; @Assert(d.bufferedBytes(), 0) }
    @TestCase func rejectsChecksumAndRecovers() { let bytes = encode(Frame(0, 1, [1, 2, 3])); let d = FrameDecoder(10); expectFrameError { => d.feed(corrupt(bytes, bytes.size - 1)); () }; @Assert(d.bufferedBytes(), 0); @Assert(d.feed(encode(Frame(0, 2, [4]))).size, 1) }
    @TestCase func resetDiscardsPartialFrame() { let bytes = encode(Frame(0, 1, [1, 2])); let d = FrameDecoder(10); d.feed(bytes[0..8]); @Assert(d.bufferedBytes(), 8); d.reset(); @Assert(d.bufferedBytes(), 0); @Assert(d.feed(bytes).size, 1) }
}
