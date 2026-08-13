<!-- cj-doc kind="api-member" level="6" id="std.io.class.stringreader.readln" parent="std.io.class.stringreader" -->
# StringReader<T> where T <: InputStream.readln

[← StringReader<T> where T <: InputStream](index.md)

## 签名

```cangjie role=signature
public func readln(): Option<String>
```

按行读取流中的数据。

## 契约

> **说明：**
>
> - 读取的数据会去掉原换行符。

返回值：

- Option\<String> - 读取成功，返回 Option\<String>.Some(str)，str 为该次读出的字符串；否则返回 Option\<String>.None。

异常：

- ContentFormatException - 当读取到非法字符时，抛出异常。
