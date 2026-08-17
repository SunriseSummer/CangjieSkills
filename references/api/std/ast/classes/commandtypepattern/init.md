<!-- cj-doc kind="api-member" level="6" id="std.ast.class.commandtypepattern.init" parent="std.ast.class.commandtypepattern" -->
# CommandTypePattern.init

[← CommandTypePattern](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public init()
```

构建一个默认的 CommandTypePattern 对象。

## 重载 2

### 签名

```cangjie role=signature
public init(inputs: Tokens)
```

从标记流中构建一个 CommandTypePattern 对象。

## 参数

- inputs: Tokens — 要解析为 `CommandTypePattern` 节点的标记集合。

## 异常

- ASTException — 如果输入的标记无法解析为有效的 `CommandTypePattern` 节点，则抛出异常。

