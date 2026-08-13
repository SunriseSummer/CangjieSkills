<!-- cj-doc kind="api-member" level="7" id="std.io.class.bufferedinputstream.close" parent="std.io.class.bufferedinputstream.extension.extend-t-bufferedinputstream-t-resource-where-t-resource" -->
# BufferedInputStream<T> where T <: InputStream.close

[← extend<T> BufferedInputStream<T> <: Resource where T <: Resource](extensions/extend-t-bufferedinputstream-t-resource-where-t-resource.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭当前流。

## 契约

> **注意：**
>
> 调用此方法后不可再调用 BufferedInputStream 的其他接口，否则会造成非预期现象。
