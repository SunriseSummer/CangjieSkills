<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.float32.extension.extend-float32" parent="std.core.intrinsic.float32" -->
# extend Float32

[← Float32](../index.md)

`extend Float32`

拓展单精度浮点数以支持一些数学常数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static Inf: Float32`](../prop-inf.md) | 获取单精度浮点数的无穷数。 |
| [`static Max: Float32`](../prop-max.md) | 获取单精度浮点数的最大值。 |
| [`static Min: Float32`](../prop-min.md) | 获取单精度浮点数的最小值。 |
| [`static MinDenormal: Float32`](../prop-mindenormal.md) | 获取单精度浮点数的最小次正规数。 |
| [`static MinNormal: Float32`](../prop-minnormal.md) | 获取单精度浮点数的最小正规数。 |
| [`static NaN: Float32`](../prop-nan.md) | 获取单精度浮点数的非数。 |
| [`static max(a: Float32, b: Float32, others: Array<Float32>): Float32`](../max.md) | 返回一组Float32中的最大值，此函数的第三个参数是一个变长参数，可以获取二个以上的Float32最大值，如果参数中有 `NaN`，该函数会返回 `NaN`。 |
| [`static min(a: Float32, b: Float32, others: Array<Float32>): Float32`](../min.md) | 返回一组Float32中的最小值，此函数的第三个参数是一个变长参数，可以获取二个以上的Float32最小值，如果参数中有 `NaN`，该函数会返回 `NaN`。 |
| [`isInf(): Bool`](../isinf.md) | 判断某个浮点数 Float32 是否为无穷数值。 |
| [`isNaN(): Bool`](../isnan.md) | 判断某个浮点数 Float32 是否为非数值。 |
| [`isNormal(): Bool`](../isnormal.md) | 判断某个浮点数 Float32 是否为常规数值。 |
