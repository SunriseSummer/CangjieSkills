<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.nonematcher" parent="std.unittest.mock" -->
# NoneMatcher

[← std.unittest.mock](../../index.md)

`NoneMatcher <: ArgumentMatcher`

参数值为 `None` 的匹配器。

## 方法

| 签名 | 功能 |
|---|---|
| [`override matchesAny(arg: Any): Bool`](matchesany.md) | 匹配任意输入值，值为 None 时返回 `true` 。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend NoneMatcher`](extensions/extend-nonematcher.md) | 扩展 NoneMatcher 。 |
