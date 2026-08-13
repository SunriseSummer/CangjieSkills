<!-- cj-doc kind="api-member" level="6" id="std.ast.class.wildcardpattern.prop-wildcard" parent="std.ast.class.wildcardpattern" -->
# WildcardPattern.wildcard

[← WildcardPattern](index.md)

## 签名

```cangjie role=signature
public mut prop wildcard: Token
```

获取或设置 WildcardPattern 节点中的 "_" 操作符的词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 "_" 操作符时，抛出异常。
