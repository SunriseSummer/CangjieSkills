<!-- cj-doc kind="api-member" level="5" id="std.ast.func.parsedecl-tokens-string" parent="std.ast" -->
# parseDecl(Tokens, String)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func parseDecl(input: Tokens, astKind!: String = ""): Decl
```

用于解析一组词法单元，获取一个 Decl 类型的节点。

## 契约

> **注意：**
>
> 该函数不支持解析 FuncParam 类型。

参数：

- input: Tokens - 待解析源码的词法单元。
- astKind!: String - 用于指定解析特定的节点类型，有效支持的值为：`PrimaryCtorDecl` 和 `PropMemberDecl`。
    - `PrimaryCtorDecl`: 解析主构造函数。
    - `PropMemberDecl`: 解析 prop 声明的 getter 和 setter 函数。

返回值：

- Decl - 一个 Decl 类型的节点。

异常：

- ParseASTException - 当输入的 Tokens 类型无法构造为 Decl 节点时，抛出异常，异常中包含报错提示信息。
