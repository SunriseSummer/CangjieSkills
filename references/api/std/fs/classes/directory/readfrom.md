<!-- cj-doc kind="api-member" level="6" id="std.fs.class.directory.readfrom" parent="std.fs.class.directory" -->
# Directory.readFrom

[← Directory](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func readFrom(Path)

### 签名

```cangjie role=signature
public static func readFrom(path: Path): Array<FileInfo>
```

获取当前目录的子项目列表。

### 契约

子项目在数组中的顺序取决于文件在系统中的排序。

参数：

- path: Path - 待读取其子项的目录对应的路径。

返回值：

- Array\<FileInfo> - 当前目录的子项目列表。

异常：

- FSException - 当指定路径不存在、指定路径不是目录或获取目录的成员信息失败时，抛出异常。
- IllegalArgumentException - 当指定路径为空或包含空字符时，抛出异常。

## static func readFrom(String)

### 签名

```cangjie role=signature
public static func readFrom(path: String): Array<FileInfo>
```

获取当前目录的子项目列表。

### 契约

子项目在数组中的顺序取决于文件在系统中的排序。

参数：

- path: String - 待读取其子项目的目录对应的路径。

返回值：

- Array\<FileInfo> - 当前目录的子项目列表。

异常：

- FSException - 当指定路径不存在、指定路径不是目录或获取目录的成员信息失败时，抛出异常。
- IllegalArgumentException - 当指定路径为空或包含空字符时，抛出异常。

## 典型示例

`Directory.readFrom` 返回当前层的 `FileInfo`；递归进入 `isDirectory()` 项，并只收集 `isRegular()` 的普通文件。累积容器使用 `ArrayList.add`，转换成数组后按完整路径排序，避免依赖文件系统枚举顺序。临时目录必须在 `finally` 中递归清理。

```cangjie cjtest=run id=api.directory.recursive-walk.run form=unit timeout=30s
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

```text cjtest=expect for=api.directory.recursive-walk.run stream=stdout match=exact
a.txt:3
nested/b.txt:2
```
