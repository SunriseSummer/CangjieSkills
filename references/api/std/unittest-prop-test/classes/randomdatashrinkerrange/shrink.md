<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.randomdatashrinkerrange.shrink" parent="std.unittest.prop_test.class.randomdatashrinkerrange" -->
# RandomDataShrinkerRange<T>.shrink

[← RandomDataShrinkerRange<T>](index.md)

## 签名

```cangjie role=signature
public override func shrink(value: T): Iterable<T>
```

将该值缩小为一组可能的“较小”值。

## 契约

返回值：

- Iterable\<T> - 数据迭代器。
