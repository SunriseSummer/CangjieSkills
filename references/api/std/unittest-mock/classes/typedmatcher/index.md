<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.typedmatcher" parent="std.unittest.mock" -->
# TypedMatcher<T>

[← std.unittest.mock](../../index.md)

`abstract TypedMatcher<T> <: ArgumentMatcher`

参数类型匹配器。

## 方法

| 签名 | 功能 |
|---|---|
| [`matches(arg: T): Bool`](matches.md) | 检查入参类型是否与预期相符。 |
| [`matchesAny(arg: Any): Bool`](matchesany.md) | 检查入参类型是否与预期相符。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> TypedMatcher<T>`](extensions/extend-t-typedmatcher-t.md) | 扩展 TypedMatcher 。 |
