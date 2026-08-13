<!-- cj-doc kind="api-member" level="6" id="std.io.class.stringreader.read" parent="std.io.class.stringreader" -->
# StringReader<T> where T <: InputStream.read

[← StringReader<T> where T <: InputStream](index.md)

## 签名

```cangjie role=signature
public func read(): ?Rune
```

按字符读取流中的数据。

## 契约

返回值：

- ?Rune - 读取成功，返回 Option\<Rune>.Some(c)，c 为该次读出的字符；否则返回 Option\<Rune>.None。

异常：

- ContentFormatException - 当读取到非法字符时，抛出异常。
