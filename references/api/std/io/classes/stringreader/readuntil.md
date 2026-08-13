<!-- cj-doc kind="api-member" level="6" id="std.io.class.stringreader.readuntil" parent="std.io.class.stringreader" -->
# StringReader<T> where T <: InputStream.readUntil

[← StringReader<T> where T <: InputStream](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func readUntil((Rune)->Bool)

### 签名

```cangjie role=signature
public func readUntil(predicate: (Rune)->Bool): Option<String>
```

从流内读取到使 `predicate` 返回 true 的字符位置（包含这个字符）或者流结束位置的数据。

### 契约

参数：

- predicate: (Rune)->Bool - 满足一定条件返回 `true` 的表达式。

返回值：

- Option\<String> - 读取成功，返回 Option\<String>.Some(str)，str 为该次读出的字符串；否则返回 Option\<String>.None。

异常：

- ContentFormatException - 当读取到非法字符时，抛出异常。

## func readUntil(Rune)

### 签名

```cangjie role=signature
public func readUntil(v: Rune): Option<String>
```

从流内读取到指定字符（包含指定字符）或者流结束位置的数据。

### 契约

参数：

- v: Rune - 指定字符。

返回值：

- Option\<String> - 读取成功，返回 Option\<String>.Some(str)，str 为该次读出的字符串；否则返回 Option\<String>.None。

异常：

- ContentFormatException - 当读取到非法字符时，抛出异常。
