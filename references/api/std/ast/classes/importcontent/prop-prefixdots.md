<!-- cj-doc kind="api-member" level="6" id="std.ast.class.importcontent.prop-prefixdots" parent="std.ast.class.importcontent" -->
# ImportContent.prefixDots

[← ImportContent](index.md)

## 签名

```cangjie role=signature
public mut prop prefixDots: Tokens
```

获取或设置 ImportContent 节点中完整包名中用于分隔每层子包的词法单元序列，可能为空。

## 契约

功能：获取或设置 ImportContent 节点中完整包名中用于分隔每层子包的词法单元序列，可能为空。如 `import a.b.c` 中的两个 "."。

类型：Tokens

异常：

- ASTException - 当设置的 Tokens 不是 "." 词法单元序列时，抛出异常。
