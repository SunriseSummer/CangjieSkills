<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.float64.extension.extend-float64" parent="std.core.intrinsic.float64" -->
# extend Float64

[← Float64](../index.md)

`extend Float64`

拓展双精度浮点数以支持一些数学常数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static Inf: Float64`](../prop-inf.md) | 获取双精度浮点数的无穷数。 |
| [`static Max: Float64`](../prop-max.md) | 获取双精度浮点数的最大值。 |
| [`static Min: Float64`](../prop-min.md) | 获取双精度浮点数的最小值。 |
| [`static MinDenormal: Float64`](../prop-mindenormal.md) | 获取双精度浮点数的最小次正规数。 |
| [`static MinNormal: Float64`](../prop-minnormal.md) | 获取双精度浮点数的最小正规数。 |
| [`static NaN: Float64`](../prop-nan.md) | 获取双精度浮点数的非数。 |
| [`static max(a: Float64, b: Float64, others: Array<Float64>): Float64`](../max.md) | 返回一组Float64中的最大值，此函数的第三个参数是一个变长参数，可以获取二个以上的Float64最大值，如果参数中有 `NaN`，该函数会返回 `NaN`。 |
| [`static min(a: Float64, b: Float64, others: Array<Float64>): Float64`](../min.md) | 返回一组Float64中的最小值，此函数的第三个参数是一个变长参数，可以获取二个以上的Float64最小值，如果参数中有 `NaN`，该函数会返回 `NaN`。 |
| [`isInf(): Bool`](../isinf.md) | 判断某个浮点数 Float64 是否为无穷数值。 |
| [`isNaN(): Bool`](../isnan.md) | 判断某个浮点数 Float64 是否为非数值。 |
| [`isNormal(): Bool`](../isnormal.md) | 判断某个浮点数 Float64 是否为常规数值。 |
