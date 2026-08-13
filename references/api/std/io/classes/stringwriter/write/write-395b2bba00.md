<!-- cj-doc kind="api-member" level="7" id="std.io.class.stringwriter.write.write-395b2bba00" parent="std.io.class.stringwriter.write" -->
# StringWriter<T> where T <: OutputStream.func write<T>(T) where T <: ToString

[← StringWriter<T> where T <: OutputStream.write](index.md)

## 签名

```cangjie role=signature
public func write<T>(v: T): Unit where T <: ToString
```

写入 ToString 类型。

## 契约

参数：

- v: T - ToString 类型的实例。
