<!-- cj-doc kind="api-member" level="5" id="std.fs.func.canonicalize" parent="std.fs" -->
# canonicalize

[← std.fs](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## canonicalize(Path)

### 签名

```cangjie role=signature
public func canonicalize(path: Path): Path
```

将 Path 实例规范化，获取绝对路径形式的规范化路径。

### 契约

所有的中间引用和软链接都会处理（UNC 路径下的软链接无法被规范化），例如，对于路径 "/foo/test/../test/bar.txt"，该函数会返回 "/foo/test/bar.txt"。

参数：

- path: Path - 待规范化的 Path 实例。

返回值：

- Path - 规范化后的 Path 实例。

异常：

- FSException - 路径不存在或无法规范化时抛出异常。
- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。

## canonicalize(String)

### 签名

```cangjie role=signature
public func canonicalize(path: String): Path
```

用 path 字符串构造 Path 实例，并进行规范化，获取绝对路径形式的规范化路径。

### 契约

所有的中间引用和软链接都会处理 （UNC 路径下的软链接无法被规范化），例如，对于路径 "/foo/test/../test/bar.txt"，该函数会返回 "/foo/test/bar.txt"。

参数：

- path: String - 待规范化的路径字符串。

返回值：

- Path - 规范化后的 Path 实例。

异常：

- FSException - 路径不存在或无法规范化时抛出异常。
- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。
