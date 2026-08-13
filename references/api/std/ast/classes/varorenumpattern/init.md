<!-- cj-doc kind="api-member" level="6" id="std.ast.class.varorenumpattern.init" parent="std.ast.class.varorenumpattern" -->
# VarOrEnumPattern.init

[← VarOrEnumPattern](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个默认的 VarOrEnumPattern 对象。

## init(Token)

### 签名

```cangjie role=signature
public init(identifier: Token)
```

构造一个 VarOrEnumPattern 对象。

### 契约

参数：

- identifier: Token - 将要构造 VarOrEnumPattern 类型的词法单元。

异常：

- ASTException - 当输入的 Tokens 类型无法构造为 VarOrEnumPattern 节点时，抛出异常。
