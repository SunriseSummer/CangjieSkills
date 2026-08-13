package sample.beta

// TODO(DOC): document the helper
// TODO(PERF): avoid the second pass
public func Beta_helper(value: Int64): Int64 {
    return value * 2
}

public func betaScale(value: Int64): Int64 {
    let factor = 3
    return value * factor
}
