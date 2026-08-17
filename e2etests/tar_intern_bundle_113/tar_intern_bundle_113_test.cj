package tar_intern_bundle_113

import std.env.*
import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

private func withTempRoot(action: (Path) -> Unit): Unit {
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

@Test
class TarInternBundle113Tests {
    @TestCase
    func archivesAndExtractsNestedUtf8Files(): Unit {
        withTempRoot { root =>
            let source = root.join("source")
            let destination = root.join("restored")
            let archive = root.join("bundle.tar.gz")
            Directory.create(source.join("nested"), recursive: true)
            File.writeTo(source.join("a.txt"), "仓颉".toArray())
            File.writeTo(source.join("nested").join("b.bin"), [0u8, 1u8, 255u8])

            archiveDirectory(source, archive)
            Directory.create(destination)
            extractArchive(archive, destination)

            @Assert(String.fromUtf8(File.readFrom(destination.join("a.txt"))), "仓颉")
            @Assert(File.readFrom(destination.join("nested").join("b.bin")), [0u8, 1u8, 255u8])
        }
    }

    @TestCase
    func internPreservesOrderDuplicatesAndInput(): Unit {
        let source = [String.fromUtf8("alpha".toArray()), "仓颉", String.fromUtf8("alpha".toArray())]
        let result = internLabels(source)
        @Assert(result, ["alpha", "仓颉", "alpha"])
        @Assert(source, ["alpha", "仓颉", "alpha"])
    }
}
