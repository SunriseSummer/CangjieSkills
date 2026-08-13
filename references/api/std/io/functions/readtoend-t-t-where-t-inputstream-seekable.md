<!-- cj-doc kind="api-member" level="5" id="std.io.func.readtoend-t-t-where-t-inputstream-seekable" parent="std.io" -->
# readToEnd<T>(T) where T <: InputStream & Seekable

[← std.io](../index.md)

## 签名

```cangjie role=signature
public func readToEnd<T>(from: T): Array<Byte> where T <: InputStream & Seekable
```

获取入参中未被读取的数据。

## 契约

参数：

- from: T - 要读取数据的对象。

返回值：

- Array\<Byte> - 未被读取的数据的拷贝。
