<!-- cj-doc kind="api-member" level="6" id="std.ast.class.functype.prop-arrow" parent="std.ast.class.functype" -->
# FuncType.arrow

[← FuncType](index.md)

## 签名

```cangjie role=signature
public mut prop arrow: Token
```

获取或设置 FuncType 节点参数类型与返回类型之间的 `->`的词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `->`的词法单元时，抛出异常。
