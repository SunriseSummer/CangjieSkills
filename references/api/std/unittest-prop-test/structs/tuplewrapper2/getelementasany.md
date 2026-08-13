<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.struct.tuplewrapper2.getelementasany" parent="std.unittest.prop_test.struct.tuplewrapper2.extension.extend-t0-t1-tuplewrapper2-t0-t1-indexaccess" -->
# TupleWrapper2<T0, T1>.getElementAsAny

[← extend<T0, T1> TupleWrapper2<T0, T1> <: IndexAccess](extensions/extend-t0-t1-tuplewrapper2-t0-t1-indexaccess.md)

## 签名

```cangjie role=signature
public func getElementAsAny(index: Int64): ?Any
```

按索引获取元组内的值。

## 契约

参数：

- index: Int64 - 索引值。

返回值：

- ?Any - 获取到的元组内的值。索引不合法时返回 `None` 。
