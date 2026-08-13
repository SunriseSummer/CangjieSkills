<!-- cj-doc kind="api-extension" level="6" id="std.core.class.box.extension.extend-t-box-t-comparable-box-t-where-t-comparable-t" parent="std.core.class.box" -->
# extend<T> Box<T> <: Comparable<Box<T>> where T <: Comparable<T>

[← Box<T>](../index.md)

`extend<T> Box<T> <: Comparable<Box<T>> where T <: Comparable<T>`

为 Box<T> 类扩展 Comparable<Box<T>> 接口，提供比较大小的能力。

## 成员

| 签名 | 功能 |
|---|---|
| [`compare(that: Box<T>): Ordering`](../compare.md) | 判断当前 Box 实例与另一个 Box 实例的大小关系。 |
| [`operator !=(that: Box<T>): Bool`](../operator-ne.md) | 比较 Box 对象是否不相等。 |
| [`operator <(that: Box<T>): Bool`](../operator-lt.md) | 比较 Box 对象的大小。 |
| [`operator <=(that: Box<T>): Bool`](../operator-le.md) | 比较 Box 对象的大小。 |
| [`operator ==(that: Box<T>): Bool`](../operator-eq.md) | 比较 Box 对象是否相等。 |
| [`operator >(that: Box<T>): Bool`](../operator-gt.md) | 比较 Box 对象的大小。 |
| [`operator >=(that: Box<T>): Bool`](../operator-ge.md) | 比较 Box 对象的大小。 |
