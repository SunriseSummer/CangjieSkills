<!-- cj-doc kind="example-leaf" level="4" id="examples.files.recursive-directory-walk" parent="examples.files" -->
# 递归遍历目录并筛选普通文件

[← 文件与目录](index.md)

递归消费 Directory.readFrom 的当前层结果，用 FileInfo 区分目录和普通文件，并稳定排序。

## 典型示例

`Directory.readFrom` 返回当前层的 `FileInfo`；递归进入 `isDirectory()` 项，并只收集 `isRegular()` 的普通文件。累积容器使用 `ArrayList.add`，转换成数组后按完整路径排序，避免依赖文件系统枚举顺序。临时目录必须在 `finally` 中递归清理。

```cangjie cjtest=run id=examples.files.recursive-directory-walk.api.directory.recursive-walk.run form=unit timeout=30s
package directory_walk

import std.collection.*
import std.env.*
import std.fs.*
import std.sort.*

func collectFiles(directory: Path, output: ArrayList<FileInfo>): Unit {
    for (entry in Directory.readFrom(directory)) {
        if (entry.isDirectory()) {
            collectFiles(entry.path, output)
        } else if (entry.isRegular()) {
            output.add(entry)
        }
    }
}

main(): Unit {
    let marker = File.createTemp(getTempDirectory())
    let root = marker.info.path
    marker.close()
    remove(root)
    Directory.create(root.join("nested"), recursive: true)
    try {
        File.writeTo(root.join("a.txt"), "abc".toArray())
        File.writeTo(root.join("nested").join("b.txt"), "xy".toArray())

        let found = ArrayList<FileInfo>()
        collectFiles(root, found)
        let files = found.toArray()
        sort(files, key: {info => info.path.toString()})
        for (file in files) {
            let relative = file.path.toString().removePrefix(root.toString())
                .removePrefix(Path.Separator).replace(Path.Separator, "/")
            println("${relative}:${file.size}")
        }
    } finally {
        removeIfExists(root, recursive: true)
    }
}
```

预期标准输出：

```text cjtest=expect for=examples.files.recursive-directory-walk.api.directory.recursive-walk.run stream=stdout match=exact
a.txt:3
nested/b.txt:2
```
