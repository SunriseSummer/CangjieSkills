<!-- cj-doc kind="api-member" level="6" id="std.env.class.consolereader.readln" parent="std.env.class.consolereader" -->
# ConsoleReader.readln

[← ConsoleReader](index.md)

## 签名

```cangjie role=signature
public func readln(): ?String
```

从标准输入中读取一行字符串。

## 契约

读取到字符，返回 ?String，结果不包含末尾换行符。该接口不会抛出异常，即使输入不符合`UTF-8`编码的字符串，也会构造出一个 String 并返回，其行为等同于 String.fromUtf8Uncheck(Array\<Byte>)。

返回值：

- ?String - 读取到的行数据，读取失败返回 `None`。
