<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.path.init" parent="std.fs.struct.path" -->
# Path.init

[← Path](index.md)

## 签名

```cangjie role=signature
public init(rawPath: String)
```

创建 Path 实例时不检查路径字符串是否合法，支持绝对路径和相对路径。

## 契约

参数：

- rawPath: String - 路径的字符串。
