<!-- cj-doc kind="api-member" level="7" id="std.io.class.stringwriter.isclosed" parent="std.io.class.stringwriter.extension.extend-t-stringwriter-t-resource-where-t-resource" -->
# StringWriter<T> where T <: OutputStream.isClosed

[← extend<T> StringWriter<T> <: Resource where T <: Resource](extensions/extend-t-stringwriter-t-resource-where-t-resource.md)

## 签名

```cangjie role=signature
public func isClosed(): Bool
```

判断当前流是否关闭。

## 契约

返回值：

- Bool - 如果当前流已经被关闭，返回 true，否则返回 false。
