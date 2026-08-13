<!-- cj-doc kind="api-member" level="6" id="std.ast.struct.token.operator-add" parent="std.ast.struct.token" -->
# Token.+

[← Token](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func +(Token)

### 签名

```cangjie role=signature
public operator func +(r: Token): Tokens
```

使用当前 Token 添加一个 Token 以获取新的 Tokens。

### 契约

参数：

- r: Token - 待添加的另一个 Token 对象。

返回值：

- Tokens - 添加新的 Tokens 后的词法单元集合。

## operator func +(Tokens)

### 签名

```cangjie role=signature
public operator func +(r: Tokens): Tokens
```

使用当前 Token 添加一个 Tokens 以获取新的 Tokens。

### 契约

参数：

- r: Tokens - 待添加的另一组 Token 对象集合。

返回值：

- Tokens - 添加新的 Tokens 后的词法单元集合。
