<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.uintnative.extension.extend-uintnative-countable" parent="std.core.intrinsic.uintnative" -->
# extend UIntNative <: Countable

[← UIntNative](../index.md)

`extend UIntNative <: Countable<UIntNative>`

为 UIntNative 类型扩展 Countable<UIntNative> 接口，支持计数操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): UIntNative`](../next.md) | 获取在数轴上当前 UIntNative 位置往右移动 `right` 后对应位置的 UIntNative 值。 |
| [`position(): Int64`](../position.md) | 获取当前 UIntNative 值的位置信息，即将该 UIntNative 转换为 Int64 值。 |
