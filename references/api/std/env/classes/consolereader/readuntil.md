<!-- cj-doc kind="api-member" level="6" id="std.env.class.consolereader.readuntil" parent="std.env.class.consolereader" -->
# ConsoleReader.readUntil

[← ConsoleReader](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func readUntil((Rune) -> Bool)

### 签名

```cangjie role=signature
public func readUntil(predicate: (Rune) -> Bool): ?String
```

从标准输入中读取数据直到读取到的字符满足`predicate`条件结束。

### 契约

满足 predicate: (Rune) -> Bool 条件的字符包含在结果中，读取失败时会返回`None`。

参数：

- predicate: (Rune) ->Bool - 终止读取的条件。

返回值：

- ?String - 将读取到的数据以 ?String 的形式返回。

## func readUntil(Rune)

### 签名

```cangjie role=signature
public func readUntil(ch: Rune): ?String
```

从标准输入中读取数据直到读取到字符 `ch` 结束。

### 契约

`ch`包含在结果中，如果读取到文件结束符 EOF，将返回读取到的所有信息，读取失败时会返回 `None`。

参数：

- ch: Rune - 终止字符。

返回值：

- ?String - 将读取到的数据以 ?String 的形式返回。
