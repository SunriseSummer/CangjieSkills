<!-- cj-doc kind="api-member" level="6" id="std.ast.class.varraytype.prop-dollar" parent="std.ast.class.varraytype" -->
# VArrayType.dollar

[← VArrayType](index.md)

## 签名

```cangjie role=signature
public mut prop dollar: Token
```

获取或设置 VArrayType 节点中的操作符 `$` 的词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `$` 词法单元时，抛出异常。
