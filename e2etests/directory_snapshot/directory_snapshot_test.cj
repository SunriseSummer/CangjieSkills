package directory_snapshot

import std.env.*
import std.fs.*

private func withTempTree(action: (Path) -> Unit): Unit {
    let marker = File.createTemp(getTempDirectory())
    let root = marker.info.path
    marker.close()
    remove(root)
    Directory.create(root)
    try {
        action(root)
    } finally {
        removeIfExists(root, recursive: true)
    }
}

private func writeText(path: Path, value: String): Unit {
    File.writeTo(path, value.toArray())
}

@Test
class DirectorySnapshotTests {
    @TestCase func emptyDirectoryIsValid() {
        withTempTree { root =>
            let snapshot = DirectorySnapshot.scan(root)
            @Assert(snapshot.size, 0)
            @Assert(snapshot.totalBytes, 0)
            @Assert(snapshot.render(), "")
        }
    }

    @TestCase func scansNestedFilesRecursively() {
        withTempTree { root =>
            Directory.create(root.join("nested"))
            writeText(root.join("a.txt"), "abc")
            writeText(root.join("nested").join("b.txt"), "xy")
            let snapshot = DirectorySnapshot.scan(root)
            @Assert(snapshot.size, 2)
            @Assert(snapshot.totalBytes, 5)
        }
    }

    @TestCase func pathsAreRelativeAndNormalized() {
        withTempTree { root =>
            Directory.create(root.join("one").join("two"), recursive: true)
            writeText(root.join("one").join("two").join("x.cj"), "z")
            @Assert(DirectorySnapshot.scan(root).entries()[0].relativePath, "one/two/x.cj")
        }
    }

    @TestCase func entriesAreSorted() {
        withTempTree { root =>
            writeText(root.join("z.txt"), "z")
            writeText(root.join("a.txt"), "a")
            @Assert(DirectorySnapshot.scan(root).render(), "a.txt:1\nz.txt:1")
        }
    }

    @TestCase func directoriesAreNotEntries() {
        withTempTree { root =>
            Directory.create(root.join("empty"))
            @Assert(DirectorySnapshot.scan(root).size, 0)
        }
    }

    @TestCase func duplicateFileNamesKeepTheirDirectories() {
        withTempTree { root =>
            Directory.create(root.join("a"))
            Directory.create(root.join("b"))
            writeText(root.join("a").join("x"), "1")
            writeText(root.join("b").join("x"), "22")
            @Assert(DirectorySnapshot.scan(root).render(), "a/x:1\nb/x:2")
        }
    }

    @TestCase func reportsUtf8ByteSize() {
        withTempTree { root =>
            writeText(root.join("unicode.txt"), "仓颉")
            @Assert(DirectorySnapshot.scan(root).totalBytes, 6)
        }
    }

    @TestCase func entriesReturnsDefensiveCopy() {
        let source = [SnapshotEntry("a", 1)]
        let snapshot = DirectorySnapshot(source)
        source[0] = SnapshotEntry("changed", 2)
        let first = snapshot.entries()
        first[0] = SnapshotEntry("also-changed", 3)
        @Assert(snapshot.render(), "a:1")
    }

    @TestCase func fileRootFails() {
        let file = File.createTemp(getTempDirectory())
        let path = file.info.path
        file.close()
        try {
            try {
                DirectorySnapshot.scan(path)
                @Fail("expected FSException")
            } catch (_: FSException) {
                @Assert(true)
            }
        } finally {
            removeIfExists(path)
        }
    }

    @TestCase func missingRootFails() {
        let file = File.createTemp(getTempDirectory())
        let path = file.info.path
        file.close()
        remove(path)
        try {
            DirectorySnapshot.scan(path)
            @Fail("expected FSException")
        } catch (_: FSException) {
            @Assert(true)
        }
    }
}
