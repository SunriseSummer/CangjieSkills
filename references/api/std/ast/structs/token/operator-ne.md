<!-- cj-doc kind="api-member" level="6" id="std.ast.struct.token.operator-ne" parent="std.ast.struct.token" -->
# Token.!=

[← Token](index.md)

## 签名

```cangjie role=signature
public operator func !=(r: Token): Bool
```

判断两个 Token 对象是否不相等。

## 契约

参数：

- r: Token - 待比较的另一个 Token 对象。

返回值：

- Bool - 两个词法单元的种类 `ID`、值、位置不相同时，返回 true。
