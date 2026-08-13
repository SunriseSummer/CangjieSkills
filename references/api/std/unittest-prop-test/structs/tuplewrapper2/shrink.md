<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.struct.tuplewrapper2.shrink" parent="std.unittest.prop_test.struct.tuplewrapper2.extension.extend-t0-t1-tuplewrapper2-t0-t1-shrink-tuplewrapper2-t0-t1-whe-aca344e1" -->
# TupleWrapper2<T0, T1>.shrink

[← extend<T0, T1> TupleWrapper2<T0, T1> <: Shrink<TupleWrapper2<T0, T1>> where T0 <: Shrink<T0>,T1 <: Shrink<T1>](extensions/extend-t0-t1-tuplewrapper2-t0-t1-shrink-tuplewrapper2-t0-t1-whe-aca344e1.md)

## 签名

```cangjie role=signature
override func shrink(): Iterable<TupleWrapper2<T0, T1>>
```

缩减元组。

## 契约

返回值：

- Iterable\<TupleWrapper2<T0, T1> - 数据迭代器。
