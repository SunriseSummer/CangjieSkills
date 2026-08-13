<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.generators.iterable" parent="std.unittest.prop_test.class.generators" -->
# Generators.iterable

[← Generators](index.md)

## 签名

```cangjie role=signature
public static func iterable<T>(random: RandomSource, collection: Array<T>): Generator<T>
```

通过从数组中随机选取来生成值的生成器。

## 契约

参数：

- random: RandomSource - 随机数。
- collection: Array\<T> - 被选取数字的数组。

返回值：

- Generator\<T> - 生成器。
