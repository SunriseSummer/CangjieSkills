<!-- cj-doc kind="api-member" level="6" id="std.ast.class.funcparam.prop-expr" parent="std.ast.class.funcparam" -->
# FuncParam.expr

[← FuncParam](index.md)

## 签名

```cangjie role=signature
public mut prop expr: Expr
```

获取或设置具有默认值的函数参数的变量初始化节点。

## 契约

类型：Expr

异常：

- ASTException - 当函数参数没有进行初始化时，抛出异常。
