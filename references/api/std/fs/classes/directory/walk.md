<!-- cj-doc kind="api-member" level="6" id="std.fs.class.directory.walk" parent="std.fs.class.directory" -->
# Directory.walk

[← Directory](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func walk(Path, (FileInfo)->Bool)

### 签名

```cangjie role=signature
public static func walk(path: Path, f: (FileInfo)->Bool): Unit
```

遍历 path 对应的目录下的子项目（非递归，即不包含子目录的子项目），对每一个子项目执行回调函数。

### 契约

walk 函数退出条件为遍历结束或回调函数 f 返回 false。遍历顺序取决于文件在系统中的排序。

参数：

- path: Path - 待遍历的目录对应的路径。
- f: (FileInfo) -> Bool - 对每一个子项目执行的回调函数，入参为子项目对应的元信息，返回值表示是否继续遍历。

异常：

- FSException - 当指定路径不存在、指定路径不是目录或获取目录的成员信息失败时，抛出异常。
- IllegalArgumentException - 当指定路径为空或包含空字符时，抛出异常。

## static func walk(String, (FileInfo)->Bool)

### 签名

```cangjie role=signature
public static func walk(path: String, f: (FileInfo)->Bool): Unit
```

遍历 path 对应的目录下的子项目（非递归，即不包含子目录的子项目），对每一个子项目执行回调函数。

### 契约

walk 函数退出条件为遍历结束或回调函数 f 返回 false。遍历顺序取决于文件在系统中的排序。

参数：

- path: String - 待遍历的目录对应的路径。
- f: (FileInfo) -> Bool - 对每一子项目执行的回调函数，入参为子项目对应的元信息，返回值表示是否继续遍历。

异常：

- FSException - 当指定路径不存在、指定路径不是目录或获取目录的成员信息失败时，抛出异常。
- IllegalArgumentException - 当指定路径为空或包含空字符时，抛出异常。
