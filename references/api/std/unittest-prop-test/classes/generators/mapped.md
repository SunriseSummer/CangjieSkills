<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.generators.mapped" parent="std.unittest.prop_test.class.generators" -->
# Generators.mapped

[← Generators](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## static func mapped<T, R>(RandomSource,(T) -> R)

### 签名

```cangjie role=signature
public static func mapped<T, R>(random: RandomSource, body: (T) -> R): Generator<R> where T <: Arbitrary<T>
```

获取 T 的 Arbitrary 实例提供的生成器，并使用函数体生成 R 类型的值。

### 契约

参数：

- random: RandomSource - 随机数。
- body: (T) -> R - 生成 R 类型的值。

返回值：

- Generator\<R> - 生成器。

## static func mapped<T1, T2, R>(RandomSource, (T1, T2) -> R)

### 签名

```cangjie role=signature
public static func mapped<T1, T2, R>(random: RandomSource, body: (T1, T2) -> R): Generator<R> where T1 <: Arbitrary<T1>, T2 <: Arbitrary<T2>
```

获取 T1，T2 的 Arbitrary 实例提供的生成器，并使用函数体生成 R 类型的值。

### 契约

参数：

- random: RandomSource - 随机数。
- body: (T1, T2) -> R - 生成 R 类型的值。

返回值：

- Generator\<R> - 生成器。

## static func mapped<T1, T2, T3, R>(RandomSource, (T1, T2, T3) -> R)

### 签名

```cangjie role=signature
public static func mapped<T1, T2, T3, R>(random: RandomSource, body: (T1, T2, T3) -> R): Generator<R>
            where T1 <: Arbitrary<T1>, T2 <: Arbitrary<T2>, T3 <: Arbitrary<T3>
```

获取 T1,T2,T3 的 Arbitrary 实例提供的生成器，并使用函数体生成 R 类型的值。

### 契约

参数：

- random: RandomSource - 随机数。
- body: (T1, T2,T3) -> R - 生成 R 类型的值。

返回值：

- Generator\<R> - 生成器。

## static func mapped<T1, T2, T3, T4, R>(RandomSource, (T1, T2, T3, T4) -> R)

### 签名

```cangjie role=signature
public static func mapped<T1, T2, T3, T4, R>(random: RandomSource, body: (T1, T2, T3, T4) -> R): Generator<R>
            where T1 <: Arbitrary<T1>, T2 <: Arbitrary<T2>, T3 <: Arbitrary<T3>, T4 <: Arbitrary<T4>
```

获取 T1,T2,T3,T4 的 Arbitrary 实例提供的生成器，并使用函数体生成 R 类型的值。

### 契约

参数：

- random: RandomSource - 随机数。
- body: (T1, T2,T3,T4) -> R - 生成 R 类型的值。

返回值：

- Generator\<R> - 生成器。
