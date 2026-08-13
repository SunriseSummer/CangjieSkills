<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.struct.tuplewrapper5.getelementasany" parent="std.unittest.prop_test.struct.tuplewrapper5.extension.extend-t0-t1-t2-t3-t4-tuplewrapper5-t0-t1-t2-t3-t4-indexaccess" -->
# TupleWrapper5<T0, T1, T2, T3, T4>.getElementAsAny

[← extend<T0, T1, T2, T3, T4> TupleWrapper5<T0, T1, T2, T3, T4> <: IndexAccess](extensions/extend-t0-t1-t2-t3-t4-tuplewrapper5-t0-t1-t2-t3-t4-indexaccess.md)

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
