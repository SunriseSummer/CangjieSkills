<!-- cj-doc kind="api-type" level="5" id="std.core.class.box" parent="std.core" -->
# Box<T>

[← std.core](../../index.md)

`Box<T>`

Box 类型提供了为其他类型添加一层 `class` 封装的能力。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`value: T`](field-value.md) | 获取或修改被包装的值。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(v: T)`](init.md) | 给定 `T` 类型实例，构造对应的 Box<T> 实例。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> Box<T> <: Comparable<Box<T>> where T <: Comparable<T>`](extensions/extend-t-box-t-comparable-box-t-where-t-comparable-t.md) | 为 Box<T> 类扩展 Comparable<Box<T>> 接口，提供比较大小的能力。 |
| [`extend<T> Box<T> <: Hashable where T <: Hashable`](extensions/extend-t-box-t-hashable-where-t-hashable.md) | 为 Box<T> 类扩展 Hashable 接口，提供比较大小的能力。 |
| [`extend<T> Box<T> <: ToString where T <: ToString`](extensions/extend-t-box-t-tostring-where-t-tostring.md) | 为 Box<T> 类型扩展 ToString 接口，支持转字符串操作。 |
