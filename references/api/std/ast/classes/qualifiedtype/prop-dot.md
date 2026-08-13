<!-- cj-doc kind="api-member" level="6" id="std.ast.class.qualifiedtype.prop-dot" parent="std.ast.class.qualifiedtype" -->
# QualifiedType.dot

[← QualifiedType](index.md)

## 签名

```cangjie role=signature
public mut prop dot: Token
```

获取或设置 QualifiedType 节点中的 "." 。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Tokens 不是 "." 词法单元时，抛出异常。
