<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.path.join" parent="std.fs.struct.path" -->
# Path.join

[← Path](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func join(Path)

### 签名

```cangjie role=signature
public func join(path: Path): Path
```

在当前路径后拼接另一个路径字符串形成新路径。

### 契约

- 对于路径 "a/b"，"c"，返回 "a/b/c"。
- 对于路径 "a"，"b/c"，返回 "a/b/c"。

参数：

- path: Path - 另一个 Path。

返回值：

- Path - 新路径的 Path 实例。

异常：

- FSException - 如果参数 path 是绝对路径则抛出异常。
- IllegalArgumentException - 当前路径为空或当前路径、入参路径非法时抛出异常。

## func join(String)

### 签名

```cangjie role=signature
public func join(path: String): Path
```

在当前路径后拼接另一个路径字符串形成新路径。

### 契约

- 对于路径 "a/b"，"c"，返回 "a/b/c"。
- 对于路径 "a"，"b/c"，返回 "a/b/c"。

参数：

- path: String - 另一个路径的字符串。

返回值：

- Path - 新路径的 Path 实例。

异常：

- FSException - 如果参数 path 是绝对路径则抛出异常。
- IllegalArgumentException - 当前路径为空或当前路径、入参路径非法时抛出异常。
