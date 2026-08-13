<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.struct.tuplewrapper4.getelementasany" parent="std.unittest.prop_test.struct.tuplewrapper4.extension.extend-t0-t1-t2-t3-tuplewrapper4-t0-t1-t2-t3-indexaccess" -->
# TupleWrapper4<T0, T1, T2, T3>.getElementAsAny

[← extend<T0, T1, T2, T3> TupleWrapper4<T0, T1, T2, T3> <: IndexAccess](extensions/extend-t0-t1-t2-t3-tuplewrapper4-t0-t1-t2-t3-indexaccess.md)

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
