<!-- cj-doc kind="api-member" level="7" id="std.io.class.bufferedoutputstream.close" parent="std.io.class.bufferedoutputstream.extension.extend-t-bufferedoutputstream-t-resource-where-t-resource" -->
# BufferedOutputStream<T> where T <: OutputStream.close

[← extend<T> BufferedOutputStream<T> <: Resource where T <: Resource](extensions/extend-t-bufferedoutputstream-t-resource-where-t-resource.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭当前流。

## 契约

> **注意：**
>
> 调用此方法后不可再调用 BufferedOutputStream 的其他接口，否则会造成非预期现象。
