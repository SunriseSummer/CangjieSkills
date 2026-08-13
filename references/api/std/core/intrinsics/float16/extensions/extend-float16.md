<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.float16.extension.extend-float16" parent="std.core.intrinsic.float16" -->
# extend Float16

[← Float16](../index.md)

`extend Float16`

拓展半精度浮点数以支持一些数学常数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static Inf: Float16`](../prop-inf.md) | 获取半精度浮点数的无穷数。 |
| [`static Max: Float16`](../prop-max.md) | 获取半精度浮点数的最大值。 |
| [`static Min: Float16`](../prop-min.md) | 获取半精度浮点数的最小值。 |
| [`static MinDenormal: Float16`](../prop-mindenormal.md) | 获取半精度浮点数的最小次正规数。 |
| [`static MinNormal: Float16`](../prop-minnormal.md) | 获取半精度浮点数的最小正规数。 |
| [`static NaN: Float16`](../prop-nan.md) | 获取半精度浮点数的非数。 |
| [`static max(a: Float16, b: Float16, others: Array<Float16>): Float16`](../max.md) | 返回一组Float16中的最大值，此函数的第三个参数是一个变长参数，可以获取二个以上的Float16最大值，如果参数中有 `NaN`，该函数会返回 `NaN`。 |
| [`static min(a: Float16, b: Float16, others: Array<Float16>): Float16`](../min.md) | 返回一组Float16中的最小值，此函数的第三个参数是一个变长参数，可以获取二个以上的Float16最小值，如果参数中有 `NaN`，该函数会返回 `NaN`。 |
| [`isInf(): Bool`](../isinf.md) | 判断某个浮点数 Float16 是否为无穷数值。 |
| [`isNaN(): Bool`](../isnan.md) | 判断某个浮点数 Float16 是否为非数值。 |
| [`isNormal(): Bool`](../isnormal.md) | 判断某个浮点数 Float16 是否为常规数值。 |
