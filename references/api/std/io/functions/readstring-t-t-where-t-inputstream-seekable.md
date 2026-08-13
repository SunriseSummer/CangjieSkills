<!-- cj-doc kind="api-member" level="5" id="std.io.func.readstring-t-t-where-t-inputstream-seekable" parent="std.io" -->
# readString<T>(T) where T <: InputStream & Seekable

[← std.io](../index.md)

## 签名

```cangjie role=signature
public func readString<T>(from: T): String where T <: InputStream & Seekable
```

读取入参中的所有剩余内容，并返回一个字符串。

## 契约

参数：

- from: T - 要读取数据的对象。

返回值：

- String - 读取到的结果字符串。

异常：

- ContentFormatException - 当剩余字节不符合 UTF-8 编码规则时，抛出异常。
