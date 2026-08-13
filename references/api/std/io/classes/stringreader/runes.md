<!-- cj-doc kind="api-member" level="6" id="std.io.class.stringreader.runes" parent="std.io.class.stringreader" -->
# StringReader<T> where T <: InputStream.runes

[← StringReader<T> where T <: InputStream](index.md)

## 签名

```cangjie role=signature
public func runes(): Iterator<Rune>
```

获得 StringReader 的 Rune 迭代器。

## 契约

返回值：

- Iterator\<Rune> - 字符串的 Rune 迭代器。

异常：

- ContentFormatException - 当`for-in`或者调用`next()`方法时读取到非法字符，抛出异常。
