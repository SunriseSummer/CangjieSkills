<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.shrinkhelpers.shrinktuple" parent="std.unittest.prop_test.class.shrinkhelpers" -->
# ShrinkHelpers.shrinkTuple

[← ShrinkHelpers](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## static func shrinkTuple<T0, T1>((T0, T1),Iterable<T0>,Iterable<T1>)

### 签名

```cangjie role=signature
public static func shrinkTuple<T0, T1>(
    tuple: (T0, T1),
    t0: Iterable<T0>,
    t1: Iterable<T1>
): Iterable<(T0, T1)>
```

实现元组的缩减迭代器。

### 契约

参数：

- tuple: (T0, T1) - 被缩减的元组。
- t0: Iterable\<T0> - 第一个元组成员的缩减迭代器。
- t1: Iterable\<T1> - 第二个元组成员的缩减迭代器。

返回值：

- Iterable\<(T0, T1)> - 元组缩减迭代器。

## static func shrinkTuple<T0, T1, T2>((T0, T1, T2),Iterable<T0>,Iterable<T1>,Iterable<T2>)

### 签名

```cangjie role=signature
public static func shrinkTuple<T0, T1, T2>(
    tuple: (T0, T1, T2),
    t0: Iterable<T0>,
    t1: Iterable<T1>,
    t2: Iterable<T2>
): Iterable<(T0, T1, T2)>
```

实现元组的缩减迭代器。

### 契约

参数：

- tuple: (T0, T1, T2) - 被缩减的元组。
- t0: Iterable\<T0> - 第一个元组成员的缩减迭代器。
- t1: Iterable\<T1> - 第二个元组成员的缩减迭代器。
- t2: Iterable\<T2> - 第三个元组成员的缩减迭代器。

返回值：

- Iterable\<(T0, T1, T2)> - 元组缩减迭代器。

## static func shrinkTuple<T0, T1, T2, T3>((T0, T1, T2, T3),Iterable<T0>,Iterable<T1>,Iterable<T2>,Iterable<T3>)

### 签名

```cangjie role=signature
public static func shrinkTuple<T0, T1, T2, T3>(
    tuple: (T0, T1, T2, T3),
    t0: Iterable<T0>,
    t1: Iterable<T1>,
    t2: Iterable<T2>,
    t3: Iterable<T3>
): Iterable<(T0, T1, T2, T3)>
```

实现元组的缩减迭代器。

### 契约

参数：

- tuple: (T0, T1, T2, T3) - 被缩减的元组。
- t0: Iterable\<T0> - 第一个元组成员的缩减迭代器。
- t1: Iterable\<T1> - 第二个元组成员的缩减迭代器。
- t2: Iterable\<T2> - 第三个元组成员的缩减迭代器。
- t3: Iterable\<T3> - 第四个元组成员的缩减迭代器。

返回值：

- Iterable\<(T0, T1, T2,T3)> - 元组缩减迭代器。

## static func shrinkTuple<T0, T1, T2, T3, T4>((T0, T1, T2, T3, T4),Iterable<T0>,Iterable<T1>,Iterable<T2>,Iterable<T3>,Iterable<T4>)

### 签名

```cangjie role=signature
public static func shrinkTuple<T0, T1, T2, T3, T4>(
    tuple: (T0, T1, T2, T3, T4),
    t0: Iterable<T0>,
    t1: Iterable<T1>,
    t2: Iterable<T2>,
    t3: Iterable<T3>,
    t4: Iterable<T4>
): Iterable<(T0, T1, T2, T3, T4)>
```

实现元组的缩减迭代器。

### 契约

参数：

- tuple: (T0, T1, T2, T3, T4) - 被缩减的元组。
- t0: Iterable\<T0> - 第一个元组成员的缩减迭代器。
- t1: Iterable\<T1> - 第二个元组成员的缩减迭代器。
- t2: Iterable\<T2> - 第三个元组成员的缩减迭代器。
- t3: Iterable\<T3> - 第四个元组成员的缩减迭代器。
- t4: Iterable\<T4> - 第五个元组成员的缩减迭代器。

返回值：

- Iterable\<(T0, T1, T2,T3,T4)> - 元组缩减迭代器。
