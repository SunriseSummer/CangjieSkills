<!-- cj-doc kind="api-member" level="6" id="std.io.class.stringreader.lines" parent="std.io.class.stringreader" -->
# StringReader<T> where T <: InputStream.lines

[← StringReader<T> where T <: InputStream](index.md)

## 签名

```cangjie role=signature
public func lines(): Iterator<String>
```

获得 StringReader 的行迭代器。

## 契约

相当于循环调用 `func readln()`，内部遇到非法字符时也会抛出异常。

> **说明：**
>
> - 每行都由换行符进行分隔。
> - 换行符是 `\n` `\r` `\r\n` 之一。
> - 每行不包括换行符。

返回值：

- Iterator\<String> - 字符串的行迭代器。

异常：

- ContentFormatException - 当`for-in`或者调用`next()`方法时读取到非法字符，抛出异常。
