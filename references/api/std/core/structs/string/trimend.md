<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.trimend" parent="std.core.struct.string" -->
# String.trimEnd

[← String](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func trimEnd((Rune)->Bool)

### 签名

```cangjie role=signature
public func trimEnd(predicate: (Rune)->Bool): String
```

修剪当前字符串，从尾开始删除符合过滤条件的 Rune 字符，直到第一个不符合过滤条件的 Rune 字符为止。

### 契约

参数：

- predicate: (Rune)->Bool - 过滤条件。

返回值：

- String - 修剪后得到的新字符串。

## func trimEnd(Array<Rune>)

### 签名

```cangjie role=signature
public func trimEnd(set: Array<Rune>): String
```

修剪当前字符串，从尾开始删除在 set 中的 Rune 字符，直到第一个不在 set 中的 Rune 字符为止。

### 契约

参数：

- set: Array\<Rune> - 待删除的字符的集合。

返回值：

- String - 修剪后得到的新字符串。

## func trimEnd(String)

### 签名

```cangjie role=signature
public func trimEnd(set: String): String
```

修剪当前字符串，从尾开始删除在 set 中的 Rune 字符，直到第一个不在 set 中的 Rune 字符为止。

### 契约

参数：

- set: String - 待删除的字符的集合。

返回值：

- String - 修剪后得到的新字符串。
