<!-- cj-doc kind="api-member" level="5" id="std.ast.func.parsetype-tokens" parent="std.ast" -->
# parseType(Tokens)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func parseType(input: Tokens): TypeNode
```

用于解析一组词法单元，获取一个 TypeNode 类型的节点。

## 契约

参数：

- input: Tokens - 待解析源码的词法单元。

返回值：

- TypeNode - 一个 TypeNode 类型的节点。

异常：

- ParseASTException - 当输入的 Tokens 类型无法构造为 TypeNode 节点时，抛出异常。
