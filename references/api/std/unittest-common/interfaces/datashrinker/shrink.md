<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.interface.datashrinker.shrink" parent="std.unittest.common.interface.datashrinker" -->
# DataShrinker<T>.shrink

[← DataShrinker<T>](index.md)

## 签名

```cangjie role=signature
func shrink(value: T): Iterable<T>
```

获取类型 T 的值并生成较小值的集合。

## 契约

功能：获取类型 T 的值并生成较小值的集合。什么被认为是“较小”取决于数据的类型。

参数：

- value: T - 被缩减的值。

返回值：

- Iterable\<T> - 较小值的集合，当数据无法再被缩减时返回空集合。
