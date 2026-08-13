<!-- cj-doc kind="api-member" level="5" id="std.ast.func.parsepatternfragment-tokens-int64" parent="std.ast" -->
# parsePatternFragment(Tokens, Int64)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func parsePatternFragment(input: Tokens, startFrom !: Int64 = 0): (Pattern, Int64)
```

用于解析一组词法单元，获取一个 Pattern 类型的节点和继续解析节点的索引。

## 契约

参数：

- input: Tokens - 待解析源码的词法单元。
- startFrom!: Int64 - 起始位置。

返回值：

- (Pattern, Int64) - 语法树节点，继续解析的位置。

异常：

- ParseASTException - 当输入的 Tokens 类型无法构造为 Pattern 节点时，抛出异常，异常中包含报错提示信息。
