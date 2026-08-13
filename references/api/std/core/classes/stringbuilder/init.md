<!-- cj-doc kind="api-member" level="6" id="std.core.class.stringbuilder.init" parent="std.core.class.stringbuilder" -->
# StringBuilder.init

[← StringBuilder](index.md)

本页汇总 5 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个初始容量为 32 的空 StringBuilder 实例。

## init(Array<Rune>)

### 签名

```cangjie role=signature
public init(value: Array<Rune>)
```

使用参数 `value` 指定的字符数组初始化一个 StringBuilder 实例，该实例的初始容量为 `value` 大小，初始内容为 `value` 包含的字符内容。

### 契约

参数：

- value: Array\<Rune> - 初始化 StringBuilder 实例的字符数组。

## init(Int64)

### 签名

```cangjie role=signature
public init(capacity: Int64)
```

使用参数 `capacity` 指定的容量初始化一个空 StringBuilder 实例，该实例的初始容量为 `value` 大小，初始内容为若干 `\0` 字符。

### 契约

参数：

- capacity: Int64 - 初始化 StringBuilder 的字节容量，取值范围为 (0, Int64.Max]。

异常：

- IllegalArgumentException - 当参数 `capacity` 的值小于等于 0 时，抛出异常。

## init(Rune, Int64)

### 签名

```cangjie role=signature
public init(r: Rune, n: Int64)
```

使用 `n` 个 `r` 字符初始化 StringBuilder 实例，该实例的初始容量为 `n`，初始内容为 `n` 个 `r` 字符。

### 契约

参数：

- r: Rune - 初始化 StringBuilder 实例的字符。
- n: Int64 - 字符 `r` 的数量，取值范围为 0, [Int64.Max]。

异常：

- IllegalArgumentException - 当参数 `n` 小于 0 时，抛出异常。

## init(String)

### 签名

```cangjie role=signature
public init(str: String)
```

根据指定初始字符串构造 StringBuilder 实例，该实例的初始容量为指定字符串的大小，初始内容为指定字符串。

### 契约

参数：

- str: String - 初始化 StringBuilder 实例的字符串。
