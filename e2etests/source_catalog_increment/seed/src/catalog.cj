package source_catalog_increment

import std.collection.*
import std.fs.*

public class SourceCatalogException <: Exception {
    public init(message: String) { super(message) }
}

public class SourceCatalog {
    private let root: Path
    private let extensions = HashSet<String>()

    public init(root: Path) { this.root = root }

    public func addExtension(extension: String): Unit {
        extensions.add(extension)
    }

    public func clearExtensions(): Unit { extensions.clear() }

    public func scan(): Array<SourceEntry> { [] }

    public func matching(pattern: String): Array<SourceEntry> { [] }

    public func totalBytes(): Int64 { 0 }

    public func render(): String { "" }
}
