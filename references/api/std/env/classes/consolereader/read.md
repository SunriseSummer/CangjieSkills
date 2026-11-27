<!-- cj-doc kind="api-member" level="6" id="std.env.class.consolereader.read" parent="std.env.class.consolereader" -->
# ConsoleReader.read

[← ConsoleReader](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func read()

### 签名

```cangjie role=signature
public func read(): ?Rune
```

从标准输入中读取下一个字符。

### 契约

返回值：

- ?Rune - 读取到字符，返回 ?Rune，否则返回 `None`。

异常：

- IllegalArgumentException - 当输入不符合`UTF-8`编码的字符串时，抛此异常。

## func read(Array<Byte>)

### 签名

```cangjie role=signature
public func read(arr: Array<Byte>): Int64
```

从标准输入中读取并放入 `arr` 中。

### 契约

> **注意：**
>
> 该函数存在风险，可能读取出来的结果恰好把 `UTF-8 code point` 从中截断，如果发生截断，将导致该 Array\<Byte> 转换成字符串的结果不正确或抛出异常。

参数：

- arr: Array\<Byte> - 目标 Array。

返回值：

- Int64 - 返回读取到的字节长度。
