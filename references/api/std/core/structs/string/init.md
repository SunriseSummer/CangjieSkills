<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.init" parent="std.core.struct.string" -->
# String.init

[← String](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public const init()
```

构造一个空的字符串。

## init(Array<Rune>)

### 签名

```cangjie role=signature
public init(value: Array<Rune>)
```

根据字符数组构造一个字符串，字符串内容为数组中的所有字符。

### 契约

参数：

- value: Array\<Rune> - 根据该字符数组构造字符串。

异常：

- IllegalArgumentException - 当试图构造长度超过 UInt32 的最大值 的字符串时，抛出异常。

## init(Collection<Rune>)

### 签名

```cangjie role=signature
public init(value: Collection<Rune>)
```

据字符集合构造一个字符串，字符串内容为集合中的所有字符。

### 契约

参数：

- value: Collection\<Rune> - 根据该字符集合构造字符串。

异常：

- IllegalArgumentException - 当试图构造长度超过 UInt32 的最大值 的字符串时，抛出异常。
