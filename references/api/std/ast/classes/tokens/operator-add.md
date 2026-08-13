<!-- cj-doc kind="api-member" level="6" id="std.ast.class.tokens.operator-add" parent="std.ast.class.tokens" -->
# Tokens.+

[← Tokens](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func +(Token)

### 签名

```cangjie role=signature
public operator func +(r: Token): Tokens
```

使用当前 Tokens 与另一个 Token 相加以获取新的 Tokens。

### 契约

参数：

- r: Token - 待操作的另一个 Token 对象。

返回值：

- Tokens - 新拼接 Tokens 后的词法单元集合。

## operator func +(Tokens)

### 签名

```cangjie role=signature
public operator func +(r: Tokens): Tokens
```

使用当前 Tokens 与 Tokens 相加以获取新的 Tokens 类型。

### 契约

参数：

- r: Tokens - 待操作的一组 Tokens 对象。

返回值：

- Tokens - 新拼接 Tokens 后的词法单元集合。
