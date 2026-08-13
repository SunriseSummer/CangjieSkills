<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.randomdatashrinker.shrink" parent="std.unittest.prop_test.class.randomdatashrinker" -->
# RandomDataShrinker<T>.shrink

[← RandomDataShrinker<T>](index.md)

## 签名

```cangjie role=signature
public override func shrink(value: T): Iterable<T>
```

获取值的缩减器。

## 契约

参数：

- value: T - 参数值。

返回值：

- Iterable\<T> - 如果参数实现了 Shrink 接口，则返回缩减后的迭代器，如果未实现，则返回空的数组。
