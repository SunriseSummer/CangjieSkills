<!-- cj-doc kind="api-type" level="5" id="std.core.enum.option" parent="std.core" -->
# Option<T>

[← std.core](../../index.md)

`Option<T>`

用 `Some`/`None` 表达可能缺失的值；优先用 `match`、`if-let`、`??` 或 `?.` 消费，只在缺失确属异常时调用 `getOrThrow()`，判断状态可用 `isSome()`/`isNone()`。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`None`](value-none.md) | 构造一个不带参数的 Option<T> 实例，表示无值。 |
| [`Some(T)`](value-some-t.md) | 构造一个携带参数的 Option<T> 实例，表示有值。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`filter(predicate: (T) -> Bool): Option<T>`](filter.md) | 提供 Option 类型的“过滤”功能。 |
| [`flatMap<R>(transform: (T) -> Option<R>): Option<R>`](flatmap.md) | 提供从 Option<T> 类型到 Option<R> 类型的映射函数，如果当前实例值是 Some，执行 transform 函数，并且返回结果，否则返回 None。 |
| [`getOrDefault(other: () -> T): T`](getordefault.md) | 获得值或返回默认值。 |
| [`getOrThrow(exception: ()->Exception): T`](getorthrow.md) | 获得值或抛出指定异常。 |
| [`getOrThrow(): T`](getorthrow.md) | 获得值或抛出异常。 |
| [`isNone(): Bool`](isnone.md) | 判断当前实例值是否为 None。 |
| [`isSome(): Bool`](issome.md) | 判断当前实例值是否为 Some。 |
| [`map<R>(transform: (T)-> R): Option<R>`](map.md) | 提供从 Option<T> 类型到 Option<R> 类型的映射函数，如果当前实例值是 Some，执行 transform 函数，并且返回 Some 封装的结果，否则返回 None。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> Option<Option<T>>`](extensions/extend-t-option-option-t.md) | 为 Option<Option<T>> 类型扩展实现某些功能。 |
| [`extend<T> Option<T> <: Equatable<Option<T>> where T <: Equatable<T>`](extensions/extend-t-option-t-equatable-option-t-where-t-equatable-t.md) | 为 Option<T> 枚举扩展 Equatable<Option<T>> 接口，支持判等操作。 |
| [`extend<T> Option<T> <: Hashable where T <: Hashable`](extensions/extend-t-option-t-hashable-where-t-hashable.md) | 为 Option 类型扩展 Hashable 接口。 |
| [`extend<T> Option<T> <: ToString where T <: ToString`](extensions/extend-t-option-t-tostring-where-t-tostring.md) | 为 Option<T> 枚举实现 ToString 接口，支持转字符串操作。 |
