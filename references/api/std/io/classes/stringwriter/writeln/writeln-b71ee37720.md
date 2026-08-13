<!-- cj-doc kind="api-member" level="7" id="std.io.class.stringwriter.writeln.writeln-b71ee37720" parent="std.io.class.stringwriter.writeln" -->
# StringWriter<T> where T <: OutputStream.func writeln<T>(T) where T <: ToString

[← StringWriter<T> where T <: OutputStream.writeln](index.md)

## 签名

```cangjie role=signature
public func writeln<T>(v: T): Unit where T <: ToString
```

写入 ToString 类型 + 换行符。

## 契约

参数：

- v: T - ToString 类型的实例。
