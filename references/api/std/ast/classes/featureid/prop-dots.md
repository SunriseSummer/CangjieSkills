<!-- cj-doc kind="api-member" level="6" id="std.ast.class.featureid.prop-dots" parent="std.ast.class.featureid" -->
# FeatureId.dots

[← FeatureId](index.md)

## 签名

```cangjie role=signature
public mut prop dots: Tokens
```

获取或设置 feature 的点号。例如：`features { user.define.sample }`。

类型：Tokens

## 异常

- ASTException - 当设置的 Tokens 不是一组 `.`。

