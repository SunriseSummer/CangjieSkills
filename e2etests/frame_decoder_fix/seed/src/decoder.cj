package frame_decoder_fix

import std.collection.*

public class FrameDecoder {
    private let maxPayload: UInt32
    private let buffer = ArrayList<UInt8>()

    public init(maxPayload: UInt32) { this.maxPayload = maxPayload }

    // Seed bug: assumes each chunk is exactly one payload and ignores framing.
    public func feed(chunk: Array<UInt8>): Array<Frame> {
        if (chunk.size == 0) { return [] }
        return [Frame(0, 0, chunk)]
    }

    public func bufferedBytes(): Int64 { buffer.size }
    public func reset(): Unit { buffer.clear() }
}
