<!-- cj-doc kind="api-member" level="6" id="std.ast.class.memberaccess.prop-langle" parent="std.ast.class.memberaccess" -->
# MemberAccess.lAngle

[← MemberAccess](index.md)

## 签名

```cangjie role=signature
public mut prop lAngle: Token
```

获取或设置 MemberAccess 节点中的左尖括号。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是左尖括号时，抛出异常。
