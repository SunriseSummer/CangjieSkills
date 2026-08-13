<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.trimstart" parent="std.core.struct.string" -->
# String.trimStart

[← String](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func trimStart((Rune)->Bool)

### 签名

```cangjie role=signature
public func trimStart(predicate: (Rune)->Bool): String
```

修剪当前字符串，从头开始删除符合过滤条件的 Rune 字符，直到第一个不符合过滤条件的 Rune 字符为止。

### 契约

参数：

- predicate: (Rune)->Bool - 过滤条件。

返回值：

- String - 修剪后得到的新字符串。

## func trimStart(Array<Rune>)

### 签名

```cangjie role=signature
public func trimStart(set: Array<Rune>): String
```

修剪当前字符串，从头开始删除在 set 中的 Rune 字符，直到第一个不在 set 中的 Rune 字符为止。

### 契约

例如 "12241".trimStart([r'1', r'2']) = "41"。

参数：

- set: Array\<Rune> - 待删除的字符的集合。

返回值：

- String - 修剪后得到的新字符串。

## func trimStart(String)

### 签名

```cangjie role=signature
public func trimStart(set: String): String
```

修剪当前字符串，从头开始删除在 set 中的 Rune 字符，直到第一个不在 set 中的 Rune 字符为止。

### 契约

例如 "12241".trimStart("12") = "41"。

参数：

- set: String - 待删除的字符的集合。

返回值：

- String - 修剪后得到的新字符串。
