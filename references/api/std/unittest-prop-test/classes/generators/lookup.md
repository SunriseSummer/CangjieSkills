<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.generators.lookup" parent="std.unittest.prop_test.class.generators" -->
# Generators.lookup

[← Generators](index.md)

## 签名

```cangjie role=signature
public static func lookup<T>(random: RandomSource): Generator<T> where T <: Arbitrary<T>
```

通过 T 的 Arbitrary 实例提供的生成器。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<T> - 生成器。
