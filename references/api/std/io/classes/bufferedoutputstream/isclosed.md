<!-- cj-doc kind="api-member" level="7" id="std.io.class.bufferedoutputstream.isclosed" parent="std.io.class.bufferedoutputstream.extension.extend-t-bufferedoutputstream-t-resource-where-t-resource" -->
# BufferedOutputStream<T> where T <: OutputStream.isClosed

[← extend<T> BufferedOutputStream<T> <: Resource where T <: Resource](extensions/extend-t-bufferedoutputstream-t-resource-where-t-resource.md)

## 签名

```cangjie role=signature
public func isClosed(): Bool
```

判断当前流是否关闭。

## 契约

返回值：

- Bool - 如果当前流已经被关闭，返回 true，否则返回 false。
