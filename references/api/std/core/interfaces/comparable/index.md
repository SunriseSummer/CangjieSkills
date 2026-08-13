<!-- cj-doc kind="api-type" level="5" id="std.core.interface.comparable" parent="std.core" -->
# Comparable<T>

[← std.core](../../index.md)

`Comparable<T> <: Equatable<T> & Less<T> & Greater<T> & LessOrEqual<T> & GreaterOrEqual<T>`

该接口表示比较运算，是等于、不等于、小于、大于、小于等于、大于等于接口的集合体。

## 方法

| 签名 | 功能 |
|---|---|
| [`compare(that: T): Ordering`](compare.md) | 判断当前 `T` 类型实例与参数指向的 `T` 类型实例的大小关系。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator <(rhs: T): Bool`](operator-lt.md) | 判断当前 `T` 类型实例是否小于参数指向的 `T` 类型实例，该函数是此接口的一个默认实现函数。 |
| [`operator <=(rhs: T): Bool`](operator-le.md) | 判断当前 `T` 类型实例是否小于等于参数指向的 `T` 类型实例，该函数是此接口的一个默认实现函数。 |
| [`operator ==(rhs: T): Bool`](operator-eq.md) | 判断两个实例是否相等，该函数是此接口的一个默认实现函数。 |
| [`operator >(rhs: T): Bool`](operator-gt.md) | 判断当前 `T` 类型实例是否大于参数指向的 `T` 类型实例，该函数是此接口的一个默认实现函数。 |
| [`operator >=(rhs: T): Bool`](operator-ge.md) | 判断当前 `T` 类型实例是否大于等于参数指向的 `T` 类型实例，该函数是此接口的一个默认实现函数。 |
