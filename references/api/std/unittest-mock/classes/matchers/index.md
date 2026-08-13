<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.matchers" parent="std.unittest.mock" -->
# Matchers

[← std.unittest.mock](../../index.md)

`Matchers`

该类提供生成匹配器的静态函数。

## 方法

| 签名 | 功能 |
|---|---|
| [`static any(): AnyMatcher`](any.md) | 允许将任何值作为参数。 |
| [`static argThat<T>(listener: ValueListener<T>, predicate: (T) -> Bool): TypedMatcher<T>`](argthat.md) | 通过传入的 predicate 闭包函数过滤传入的参数值，允许 listener 值监听器对满足条件的传入参数值进行处理。 |
| [`static argThat<T>(predicate: (T) -> Bool): TypedMatcher<T>`](argthat.md) | 根据提供的过滤器闭包过滤输入值。 |
| [`static argThatNot<T>(predicate: (T) -> Bool): TypedMatcher<T>`](argthatnot.md) | 根据提供的过滤器闭包过滤输入值。 |
| [`static capture<T>(listener: ValueListener<T>): TypedMatcher<T>`](capture.md) | 允许 listener 值监听器对类型为 T 的传入参数值进行处理。 |
| [`static default<T>(target: T): TypedMatcher<T>`](default.md) | 根据结构（更高优先级）或引用相等性来匹配值。 |
| [`static eq<T>(target: T): TypedMatcher<T> where T <: Equatable<T>`](eq.md) | 根据与提供的值的结构相等性过滤输入值。 |
| [`static ofType<T>(): TypedMatcher<T>`](oftype.md) | 根据类型过滤输入值。 |
| [`static same<T>(target: T): TypedMatcher<T> where T <: Object`](same.md) | 根据与所提供对象的引用相等性来过滤输入值。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Matchers`](extensions/extend-matchers.md) | 扩展 Matchers 。 |
