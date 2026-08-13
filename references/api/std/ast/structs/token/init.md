<!-- cj-doc kind="api-member" level="6" id="std.ast.struct.token.init" parent="std.ast.struct.token" -->
# Token.init

[← Token](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个默认的 Token 对象，其中 TokenKind 类型为 `ILLEGAL`，`value` 为空字符串，Position 成员变量均为 0。

## init(TokenKind)

### 签名

```cangjie role=signature
public init(kind: TokenKind)
```

根据词法单元类型，构造一个默认的 Token 对象。

### 契约

参数：

- kind: TokenKind - 构建词法单元的类型。

## init(TokenKind, String)

### 签名

```cangjie role=signature
public init(kind: TokenKind, value: String)
```

根据词法单元类型 `kind` 和词法单元值 `value`，构造一个 Token 对象。

### 契约

参数：

- kind: TokenKind - 要构建词法单元的类型。
- value: String - 要构建词法单元的 `value` 值。

异常：

- IllegalArgumentException - 当输入的 `kind` 与 `value` 不匹配时，抛出异常点。
