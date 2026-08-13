package auditor_core.native

import auditor_core.model.AuditException

foreign {
    func auditor_abi_version(): Int64

    func auditor_digest(data: CPointer<UInt8>, length: Int64): Int64

    func auditor_digest_update(state: Int64, data: CPointer<UInt8>, length: Int64): Int64

    func auditor_count_byte(data: CPointer<UInt8>, length: Int64, target: UInt8): Int64

    func auditor_scale(values: CPointer<Int64>, length: Int64, factor: Int64): Int64
}

public func nativeAbiVersion(): Int64 {
    return unsafe { auditor_abi_version() }
}

public func nativeDigest(bytes: Array<UInt8>): Int64 {
    var result: Int64 = 0
    unsafe {
        let handle = acquireArrayRawData(bytes)
        result = auditor_digest(handle.pointer, bytes.size)
        releaseArrayRawData(handle)
    }
    return result
}

public func nativeCountByte(bytes: Array<UInt8>, target: UInt8): Int64 {
    var result: Int64 = 0
    unsafe {
        let handle = acquireArrayRawData(bytes)
        result = auditor_count_byte(handle.pointer, bytes.size, target)
        releaseArrayRawData(handle)
    }
    return result
}

public func nativeScale(values: Array<Int64>, factor: Int64): Int64 {
    var result: Int64 = 0
    unsafe {
        let handle = acquireArrayRawData(values)
        result = auditor_scale(handle.pointer, values.size, factor)
        releaseArrayRawData(handle)
    }
    return result
}

public class NativeDigest <: Resource {
    private var state: Int64 = 0
    private var closed: Bool = false

    public init() {
        this.state = 0
        this.closed = false
    }

    public func update(bytes: Array<UInt8>): Unit {
        if (closed) {
            throw AuditException("native digest already closed")
        }
        var next: Int64 = 0
        unsafe {
            let handle = acquireArrayRawData(bytes)
            next = auditor_digest_update(state, handle.pointer, bytes.size)
            releaseArrayRawData(handle)
        }
        state = next
    }

    public func value(): Int64 {
        if (closed) {
            throw AuditException("native digest already closed")
        }
        return state
    }

    public func isClosed(): Bool {
        return closed
    }

    public func close(): Unit {
        closed = true
    }
}
