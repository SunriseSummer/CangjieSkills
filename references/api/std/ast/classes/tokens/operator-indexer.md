<!-- cj-doc kind="api-member" level="6" id="std.ast.class.tokens.operator-indexer" parent="std.ast.class.tokens" -->
# Tokens.[]

[← Tokens](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func \[](Int64)

### 签名

```cangjie role=signature
public operator func [](index: Int64): Token
```

操作符重载，通过索引值获取对应 Token。

### 契约

参数：

- index: Int64 - 待索引的数值。

返回值：

- Token - 返回索引对应的 Token。

异常：

- IndexOutOfBoundsException - 当 `index` 无效时，抛出异常。

## operator func \[](Range<Int64>)

### 签名

```cangjie role=signature
public open operator func [](range: Range<Int64>): Tokens
```

操作符重载，通过 `range` 获取对应 Tokens 切片。

### 契约

参数：

- range: Range\<Int64> - 待索引的切片范围。

返回值：

- Tokens - 返回切片索引对应的 Tokens。

异常：

- IllegalArgumentException - 当 `range.step` 不等于 1 时，抛出异常。
- IndexOutOfBoundsException - 当 range 无效时，抛出异常。
