<!-- cj-doc kind="api-member" level="6" id="std.ast.class.prefixtype.init" parent="std.ast.class.prefixtype" -->
# PrefixType.init

[← PrefixType](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个默认的 PrefixType 对象。

## init(Tokens)

### 签名

```cangjie role=signature
public init(inputs: Tokens)
```

构造一个 PrefixType 对象。

### 契约

参数：

- inputs: Tokens - 将要构造 PrefixType 类型的词法单元集合 (Tokens)。

异常：

- ASTException - 当输入的 Tokens 类型无法构造为 PrefixType 节点时，抛出异常。
