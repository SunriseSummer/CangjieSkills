<!-- cj-doc kind="api-member" level="7" id="std.io.class.stringwriter.close" parent="std.io.class.stringwriter.extension.extend-t-stringwriter-t-resource-where-t-resource" -->
# StringWriter<T> where T <: OutputStream.close

[← extend<T> StringWriter<T> <: Resource where T <: Resource](extensions/extend-t-stringwriter-t-resource-where-t-resource.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭当前流。

## 契约

> **注意：**
>
> 调用此方法后不可再调用 StringWriter 的其他接口，否则会造成非预期现象。
