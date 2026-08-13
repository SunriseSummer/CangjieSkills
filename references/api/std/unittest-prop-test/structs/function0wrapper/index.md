<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.struct.function0wrapper" parent="std.unittest.prop_test" -->
# Function0Wrapper<R>

[← std.unittest.prop_test](../../index.md)

`Function0Wrapper<R>`

将闭包封装为结构体。

## 方法

| 签名 | 功能 |
|---|---|
| [`Function0Wrapper(public let function: () -> R)`](function0wrapper-r.md) | Function0Wrapper 构造器。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`function: () -> R`](field-function.md) | 函数对象自身。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator () (): R`](operator-call.md) | 调用操作符函数。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<R> Function0Wrapper<R> <: Arbitrary<Function0Wrapper<R>> where R <: Arbitrary<R>`](extensions/extend-r-function0wrapper-r-arbitrary-function0wrapper-r-where-c1baf81e.md) | 为 Function0Wrapper 扩展 Arbitrary 实现。 |
