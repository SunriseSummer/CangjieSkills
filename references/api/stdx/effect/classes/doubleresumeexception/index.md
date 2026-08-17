<!-- cj-doc kind="api-type" level="5" id="stdx.effect.class.doubleresumeexception" parent="stdx.effect" -->
# DoubleResumeException

[← stdx.effect](../../index.md)

`class DoubleResumeException <: Exception`

同一个 Effect Handler 恢复点只能恢复一次；重复恢复时抛出此异常，默认消息为 `Resumption resumed multiple times`。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造重复恢复异常。 |

