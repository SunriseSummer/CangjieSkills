<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.enum.stubmode.value-returnsdefaults" parent="std.unittest.mock.enum.stubmode" -->
# StubMode.ReturnsDefaults

[← StubMode](index.md)

## 签名

```cangjie role=signature
ReturnsDefaults
```

`Mock object` 将为基础类型返回默认的值。

## 契约

功能：`Mock object` 将为基础类型返回默认的值。用于简化 `mock object` 的配置步骤。
这些默认值一般为空或 0 。
支持的基础类型为：Unit, 数值类型（ 如 Int64 ）, option 类型, Bool, String, Array, ArrayList, HashSet, HashMap 。
