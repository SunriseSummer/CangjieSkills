<!-- cj-doc kind="api-member" level="7" id="std.io.class.stringreader.close" parent="std.io.class.stringreader.extension.extend-t-stringreader-t-resource-where-t-resource" -->
# StringReader<T> where T <: InputStream.close

[← extend<T> StringReader<T> <: Resource where T <: Resource](extensions/extend-t-stringreader-t-resource-where-t-resource.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭当前流。

## 契约

> **注意：**
>
> 调用此方法后不可再调用 StringReader 的其他接口，否则会造成非预期现象。
