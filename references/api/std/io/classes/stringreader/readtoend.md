<!-- cj-doc kind="api-member" level="6" id="std.io.class.stringreader.readtoend" parent="std.io.class.stringreader" -->
# StringReader<T> where T <: InputStream.readToEnd

[← StringReader<T> where T <: InputStream](index.md)

## 签名

```cangjie role=signature
public func readToEnd(): String
```

读取流中所有剩余数据。

## 契约

返回值：

- String - 流中所有剩余数据。

异常：

- ContentFormatException - 当读取到非法字符时，抛出异常。
