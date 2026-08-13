<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.generators.pick" parent="std.unittest.prop_test.class.generators" -->
# Generators.pick

[← Generators](index.md)

## 签名

```cangjie role=signature
public static func pick<T>(random: RandomSource, variants: Array<Generator<T>>): Generator<T>
```

通过从生成器数组中随机选取来生成值的生成器。

## 契约

参数：

- random: RandomSource - 随机数。
- variants: Array\<Generator\<T>> - 生成器数组。

返回值：

- Generator\<T> - 生成器。
