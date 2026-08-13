package binary_frame_fix

import std.binary.*
import std.collection.*

public class FrameException <: Exception {
    public init(message: String) { super(message) }
}

public class Frame {
    public let kind: UInt16
    public let payload: Array<UInt8>
    public init(kind: UInt16, payload: Array<UInt8>) {
        this.kind = kind
        this.payload = payload
    }
}

public class FrameCodec {
    private static let MAX_PAYLOAD: Int64 = 1024 * 1024

    public static func encode(frame: Frame): Array<UInt8> {
        if (frame.payload.size > MAX_PAYLOAD) { throw FrameException("payload too large") }
        let result = Array<UInt8>(10 + frame.payload.size, repeat: 0)
        result[0] = 0x43
        result[1] = 0x4A
        result[2] = 1
        let kindBytes: Array<UInt8> = [0, 0]
        frame.kind.writeLittleEndian(kindBytes)
        kindBytes.copyTo(result, 0, 3, 2)
        let lengthBytes: Array<UInt8> = [0, 0, 0, 0]
        UInt32(frame.payload.size).writeLittleEndian(lengthBytes)
        lengthBytes.copyTo(result, 0, 5, 4)
        frame.payload.copyTo(result, 0, 9, frame.payload.size)
        return result
    }

    public static func decode(bytes: Array<UInt8>): Frame {
        if (bytes.size < 10) { throw FrameException("frame too short") }
        let kind = UInt16.readLittleEndian(bytes.slice(3, 2))
        let length = UInt32.readLittleEndian(bytes.slice(5, 4))
        let payload = bytes.slice(9, Int64(length))
        return Frame(kind, payload)
    }
}

main(): Unit {
    let wire = FrameCodec.encode(Frame(0x1234, [1, 2, 3]))
    let frame = FrameCodec.decode(wire)
    println("wire=${String.join(wire.map({value => value.toString()}), delimiter: ",")}")
    println("kind=${frame.kind}")
    println("payload=${String.join(frame.payload.map({value => value.toString()}), delimiter: ",")}")
}
