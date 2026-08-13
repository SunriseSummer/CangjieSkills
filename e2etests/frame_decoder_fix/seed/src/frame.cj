package frame_decoder_fix

public class FrameException <: Exception {
    public init(message: String) { super(message) }
}

public struct Frame {
    public let flags: UInt8
    public let sequence: Int64
    public let payload: Array<UInt8>
    public init(flags: UInt8, sequence: Int64, payload: Array<UInt8>) {
        this.flags = flags
        this.sequence = sequence
        this.payload = payload
    }
}

// Seed implementation is intentionally incomplete.
public func encode(frame: Frame): Array<UInt8> {
    return frame.payload.clone()
}
