<!-- cj-doc kind="api-member" level="5" id="std.ast.func.parsedeclfragment-tokens-int64" parent="std.ast" -->
# parseDeclFragment(Tokens, Int64)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func parseDeclFragment(input: Tokens, startFrom !: Int64 = 0): (Decl, Int64)
```

用于解析一组词法单元，获取一个 Decl 类型的节点和继续解析节点的索引。

## 契约

> **注意：**
>
> 该函数不支持解析 FuncParam、 PropDecl、PrimaryCtorDecl 类型。

参数：

- input: Tokens - 待解析源码的词法单元。
- startFrom!: Int64 - 起始位置。

返回值：

- (Decl, Int64) - 语法树节点，继续解析的位置。

异常：

- ParseASTException - 当输入的 Tokens 类型无法构造为 Decl 节点时，抛出异常，异常中包含报错提示信息。
