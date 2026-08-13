package binary_frame_fix

private func expectFrameError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected FrameException")
    } catch (_: FrameException) {
        @Assert(true)
    }
}

@Test
class FrameCodecTests {
    @TestCase func encodesExactWireFormat() {
        let wire = FrameCodec.encode(Frame(0x1234, [1, 2, 3]))
        let expected: Array<UInt8> = [67, 74, 1, 52, 18, 0, 0, 0, 3, 1, 2, 3, 80]
        @Assert(wire, expected)
    }

    @TestCase func roundTripsEmptyPayload() {
        let decoded = FrameCodec.decode(FrameCodec.encode(Frame(7, [])))
        @Assert(decoded.kind, 7)
        @Assert(decoded.payload, [])
    }

    @TestCase func lengthUsesBigEndian() {
        let payload = Array<UInt8>(258, repeat: 9)
        let wire = FrameCodec.encode(Frame(1, payload))
        @Assert(wire[5], 0)
        @Assert(wire[6], 0)
        @Assert(wire[7], 1)
        @Assert(wire[8], 2)
        @Assert(FrameCodec.decode(wire).payload.size, 258)
    }

    @TestCase func kindUsesLittleEndian() {
        let wire = FrameCodec.encode(Frame(0xABCD, []))
        @Assert(wire[3], 0xCD)
        @Assert(wire[4], 0xAB)
        @Assert(FrameCodec.decode(wire).kind, 0xABCD)
    }

    @TestCase func rejectsTooShortFrame() {
        expectFrameError { => FrameCodec.decode([]); () }
        expectFrameError { => FrameCodec.decode([67, 74, 1]); () }
    }

    @TestCase func rejectsMagicAndVersion() {
        let wire = FrameCodec.encode(Frame(1, []))
        let badMagic = wire.clone()
        badMagic[0] = 0
        expectFrameError { => FrameCodec.decode(badMagic); () }
        let badVersion = wire.clone()
        badVersion[2] = 2
        expectFrameError { => FrameCodec.decode(badVersion); () }
    }

    @TestCase func rejectsTruncatedPayload() {
        let wire = FrameCodec.encode(Frame(2, [1, 2, 3]))
        expectFrameError { => FrameCodec.decode(wire.slice(0, wire.size - 1)); () }
    }

    @TestCase func rejectsTrailingData() {
        let wire = FrameCodec.encode(Frame(2, [1]))
        let extended = Array<UInt8>(wire.size + 1, repeat: 0)
        wire.copyTo(extended)
        expectFrameError { => FrameCodec.decode(extended); () }
    }

    @TestCase func rejectsChecksumMismatch() {
        let wire = FrameCodec.encode(Frame(3, [4, 5]))
        wire[9] = 9
        expectFrameError { => FrameCodec.decode(wire); () }
    }

    @TestCase func rejectsOversizedDeclaredLength() {
        let wire: Array<UInt8> = [67, 74, 1, 0, 0, 0, 16, 0, 1, 18]
        expectFrameError { => FrameCodec.decode(wire); () }
    }

    @TestCase func frameClonesInputPayload() {
        let payload: Array<UInt8> = [1, 2]
        let frame = Frame(1, payload)
        payload[0] = 9
        let expected: Array<UInt8> = [1, 2]
        @Assert(frame.payload, expected)
    }

    @TestCase func decodedPayloadDoesNotAliasWire() {
        let wire = FrameCodec.encode(Frame(1, [5, 6]))
        let frame = FrameCodec.decode(wire)
        wire[9] = 7
        let expected: Array<UInt8> = [5, 6]
        @Assert(frame.payload, expected)
    }
}
