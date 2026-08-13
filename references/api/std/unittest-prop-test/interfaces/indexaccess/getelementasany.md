<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.indexaccess.getelementasany" parent="std.unittest.prop_test.interface.indexaccess" -->
# IndexAccess.getElementAsAny

[← IndexAccess](index.md)

## 签名

```cangjie role=signature
func getElementAsAny(index: Int64): ?Any
```

通过索引访问元组元素。

## 契约

参数：

- index: Int64 - 索引值。

返回值：

- ?Any - 元素值。若未获取到则为 `None` 。
