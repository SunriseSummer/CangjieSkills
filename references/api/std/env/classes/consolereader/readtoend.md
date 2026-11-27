<!-- cj-doc kind="api-member" level="6" id="std.env.class.consolereader.readtoend" parent="std.env.class.consolereader" -->
# ConsoleReader.readToEnd

[← ConsoleReader](index.md)

## 签名

```cangjie role=signature
public func readToEnd(): ?String
```

从标准输入中读取所有字符。

## 契约

直到读取到文件结束符`EOF`，或者在 Linux 上键入 `Ctrl+D` 或在 Windows 上键入 `Ctrl+Z` + 回车结束。读取到字符，返回 ?String，否则返回 `None`。读取失败时会返回 `None`，该接口不会抛出异常，即使输入不符合 `UTF-8` 编码的字符串，也会构造出一个 String 并返回，其行为等同于 String.fromUtf8Uncheck(Array\<Byte>)。

返回值：

- ?String - 将读取到的所有数据以 ?String 的形式返回。
