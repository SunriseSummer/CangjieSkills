<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.generators.weighted" parent="std.unittest.prop_test.class.generators" -->
# Generators.weighted

[← Generators](index.md)

## 签名

```cangjie role=signature
public static func weighted<T>(random: RandomSource, variants: Array<(UInt64, Generator<T>)>): Generator<T>
```

通过从成对数组（权重、生成器）中随机选取来生成值的生成器。

## 契约

参数：

- random: RandomSource - 随机数。
- variants: Array\<(UInt64, Generator\<T>)> - 数组（权重、生成器）。

返回值：

- Generator\<T> - 生成器。
