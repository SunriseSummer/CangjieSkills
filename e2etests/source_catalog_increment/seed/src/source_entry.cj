package source_catalog_increment

public struct SourceEntry {
    public let relativePath: String
    public let bytes: Int64

    public init(relativePath: String, bytes: Int64) {
        this.relativePath = relativePath
        this.bytes = bytes
    }
}
