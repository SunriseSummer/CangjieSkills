<!-- cj-doc kind="api-member" level="6" id="std.ast.class.tokens.append" parent="std.ast.class.tokens" -->
# Tokens.append

[← Tokens](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func append(Node)

### 签名

```cangjie role=signature
public func append(node: Node): Tokens
```

将当前的 Tokens 与传入节点所转换得到的 Tokens 进行拼接。

### 契约

参数：

- node: Node - 待拼接的 Node 对象。

返回值：

- Tokens - 拼接后的 Tokens 类型。

## func append(Token)

### 签名

```cangjie role=signature
public open func append(token: Token): Tokens
```

将当前的 Tokens 与传入的 Token 进行拼接。

### 契约

参数：

- token: Token - 待拼接的 Token 对象。

返回值：

- Tokens - 拼接后的 Tokens 类型。

## func append(Tokens)

### 签名

```cangjie role=signature
public open func append(tokens: Tokens): Tokens
```

在当前的 Tokens 后追加传入的 Tokens 进行拼接（该接口性能较其他拼接函数表现更好）。

### 契约

参数：

- tokens: Tokens - 待拼接的 Tokens 对象。

返回值：

- Tokens - 拼接后的 Tokens 类型。
