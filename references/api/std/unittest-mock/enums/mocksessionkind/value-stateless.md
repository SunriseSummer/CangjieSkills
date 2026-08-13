<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.enum.mocksessionkind.value-stateless" parent="std.unittest.mock.enum.mocksessionkind" -->
# MockSessionKind.Stateless

[← MockSessionKind](index.md)

## 签名

```cangjie role=signature
Stateless
```

只允许无状态的桩。

## 契约

功能：只允许无状态的桩。
不允许本质上有状态的操作，例如 returnsConsequively 和基数说明符（ cardinality specifier， 指定预期执行次数的表达式）。
