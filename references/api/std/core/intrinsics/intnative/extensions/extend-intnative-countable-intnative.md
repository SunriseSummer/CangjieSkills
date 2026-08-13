<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.intnative.extension.extend-intnative-countable-intnative" parent="std.core.intrinsic.intnative" -->
# extend IntNative <: Countable<IntNative>

[← IntNative](../index.md)

`extend IntNative <: Countable<IntNative>`

为 IntNative 类型扩展 Countable<IntNative> 接口，支持计数操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): IntNative`](../next.md) | 获取在数轴上当前 IntNative 位置往右移动 `right` 后对应位置的 IntNative 值。 |
| [`position(): Int64`](../position.md) | 获取当前 IntNative 值的位置信息，即将该 IntNative 转换为 Int64 值。 |
