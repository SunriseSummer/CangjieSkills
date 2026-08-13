<!-- cj-doc kind="api-member" level="6" id="std.ast.class.expr.dump" parent="std.ast.class.expr" -->
# Expr.dump

[← Expr](index.md)

## 签名

```cangjie role=signature
protected open func dump(_: UInt16): String
```

将当前语法树节点转化为树形结构的形态并进行打印，需要被子类重写。

## 契约

参数：

- _: UInt16 - 格式化输出的缩进空格数量。

返回值：

- String - 格式化输出内容。
