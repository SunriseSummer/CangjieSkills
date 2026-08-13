<!-- cj-doc kind="api-member" level="5" id="std.ast.func.parsepattern-tokens" parent="std.ast" -->
# parsePattern(Tokens)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func parsePattern(input: Tokens): Pattern
```

用于解析一组词法单元，获取一个 Pattern 类型的节点。

## 契约

参数：

- input: Tokens - 待解析源码的词法单元。

返回值：

- Pattern - 一个 Pattern 类型的节点。

异常：

- ParseASTException - 当输入的 Tokens 类型无法构造为 Pattern 节点时，抛出异常，异常中包含报错提示信息。
