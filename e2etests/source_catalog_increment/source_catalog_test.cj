package source_catalog_increment

import std.env.*
import std.fs.*

private func withTree(action: (Path) -> Unit): Unit {
    let marker = File.createTemp(getTempDirectory())
    let root = marker.info.path
    marker.close()
    remove(root)
    Directory.create(root)
    try { action(root) } finally { removeIfExists(root, recursive: true) }
}

private func write(path: Path, text: String): Unit { File.writeTo(path, text.toArray()) }

private func expectCatalogError(action: () -> Unit): Unit {
    try { action(); @Fail("expected SourceCatalogException") } catch (_: SourceCatalogException) { @Assert(true) }
}

@Test
class SourceCatalogTests {
    @TestCase func recursivelyScansAndSorts() { withTree { root => Directory.create(root.join("z")); write(root.join("z").join("b.cj"), "bb"); write(root.join("a.cj"), "a"); let entries = SourceCatalog(root).scan(); @Assert(entries.size, 2); @Assert(entries[0].relativePath, "a.cj"); @Assert(entries[1].relativePath, "z/b.cj") } }
    @TestCase func reportsUtf8ByteLength() { withTree { root => write(root.join("unicode.cj"), "仓颉"); let entry = SourceCatalog(root).scan()[0]; @Assert(entry.bytes, 6) } }
    @TestCase func extensionFilterAcceptsDotAndCase() { withTree { root => write(root.join("a.CJ"), "a"); write(root.join("b.txt"), "b"); let catalog = SourceCatalog(root); catalog.addExtension(" .cJ "); @Assert(catalog.scan().size, 1); @Assert(catalog.scan()[0].relativePath, "a.CJ") } }
    @TestCase func duplicateExtensionsDoNotDuplicateFiles() { withTree { root => write(root.join("a.cj"), "a"); let c = SourceCatalog(root); c.addExtension("cj"); c.addExtension(".CJ"); @Assert(c.scan().size, 1) } }
    @TestCase func clearExtensionsRestoresAllFiles() { withTree { root => write(root.join("a.cj"), "a"); write(root.join("b.txt"), "b"); let c = SourceCatalog(root); c.addExtension("cj"); @Assert(c.scan().size, 1); c.clearExtensions(); @Assert(c.scan().size, 2) } }
    @TestCase func matchingSearchesUtf8Content() { withTree { root => write(root.join("a.cj"), "class Alpha"); write(root.join("b.cj"), "func beta"); let c = SourceCatalog(root); c.addExtension("cj"); let found = c.matching("class\\s+[A-Z]"); @Assert(found.size, 1); @Assert(found[0].relativePath, "a.cj") } }
    @TestCase func invalidRegexBecomesCatalogError() { withTree { root => let c = SourceCatalog(root); expectCatalogError { => c.matching("["); () } } }
    @TestCase func invalidRootsFail() { let file = File.createTemp(getTempDirectory()); let path = file.info.path; file.close(); try { expectCatalogError { => SourceCatalog(path); () } } finally { removeIfExists(path) }; expectCatalogError { => SourceCatalog(path); () } }
    @TestCase func emptyExtensionFails() { withTree { root => let c = SourceCatalog(root); expectCatalogError { => c.addExtension(" . "); () } } }
    @TestCase func resultsAreIndependent() { withTree { root => write(root.join("a.cj"), "a"); let c = SourceCatalog(root); let first = c.scan(); first[0] = SourceEntry("changed", 99); write(root.join("b.cj"), "b"); @Assert(first.size, 1); @Assert(c.scan().size, 2) } }
    @TestCase func totalAndRenderUseFreshScan() { withTree { root => write(root.join("b.cj"), "bb"); write(root.join("a.cj"), "a"); let c = SourceCatalog(root); @Assert(c.totalBytes(), 3); @Assert(c.render(), "a.cj:1\nb.cj:2") } }
}
