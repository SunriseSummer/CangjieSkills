<!-- cj-doc kind="api-member" level="7" id="std.io.class.bufferedinputstream.isclosed" parent="std.io.class.bufferedinputstream.extension.extend-t-bufferedinputstream-t-resource-where-t-resource" -->
# BufferedInputStream<T> where T <: InputStream.isClosed

[← extend<T> BufferedInputStream<T> <: Resource where T <: Resource](extensions/extend-t-bufferedinputstream-t-resource-where-t-resource.md)

## 签名

```cangjie role=signature
public func isClosed(): Bool
```

判断当前流是否关闭。

## 契约

返回值：

- Bool - 如果当前流已经被关闭，返回 true，否则返回 false。
