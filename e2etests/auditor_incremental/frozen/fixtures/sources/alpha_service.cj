package sample.alpha

// TODO(PERF): cache the lookup table
public class AlphaService {
    public var retries: Int64 = 3

    public func lookup(key: String): Int64 {
        return key.size
    }
}

public func alphaEntry(): Int64 {
    let seed = 7
    return seed
}
