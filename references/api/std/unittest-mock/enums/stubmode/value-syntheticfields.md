<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.enum.stubmode.value-syntheticfields" parent="std.unittest.mock.enum.stubmode" -->
# StubMode.SyntheticFields

[← StubMode](index.md)

## 签名

```cangjie role=signature
SyntheticFields
```

`Mock object` 会将其可变属性和字段视为可变字段。

## 契约

功能：`Mock object` 会将其可变属性和字段视为可变字段。
与直接使用 SyntheticField 类似，但更简洁。
读取未初始化的字段将导致错误。
