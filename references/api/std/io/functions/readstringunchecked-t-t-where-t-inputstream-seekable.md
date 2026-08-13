<!-- cj-doc kind="api-member" level="5" id="std.io.func.readstringunchecked-t-t-where-t-inputstream-seekable" parent="std.io" -->
# readStringUnchecked<T>(T) where T <: InputStream & Seekable

[← std.io](../index.md)

## 签名

```cangjie role=signature
public unsafe func readStringUnchecked<T>(from: T): String where T <: InputStream & Seekable
```

读取入参中的所有剩余内容，并返回一个字符串。

## 契约

功能：读取入参中的所有剩余内容，并返回一个字符串。该函数不会检查字符串的合法性。

参数：

- from: T - 要读取数据的对象。

返回值：

- String - 读取到的结果字符串。
