<!-- cj-doc kind="api-type" level="5" id="std.math.interface.floatingpoint" parent="std.math" -->
# FloatingPoint<T>

[← std.math](../../index.md)

`FloatingPoint<T> <: Number<T>`

本接口提供了浮点数相关的方法。

## 方法

| 签名 | 功能 |
|---|---|
| [`static getE(): T`](gete.md) | 获取 T 类型的自然常数。 |
| [`static getInf(): T`](getinf.md) | 获取浮点数的无穷数。 |
| [`static getMinDenormal(): T`](getmindenormal.md) | 获取单精度浮点数的最小次正规数。 |
| [`static getMinNormal(): T`](getminnormal.md) | 获取单精度浮点数的最小正规数。 |
| [`static getNaN(): T`](getnan.md) | 获取浮点数的非数。 |
| [`static getPI(): T`](getpi.md) | 返回对应浮点类型的圆周率常数；调用具体实现 `Float16.getPI()`、`Float32.getPI()` 或 `Float64.getPI()`，并导入 `std.math` 扩展。 |
| [`isInf(): Bool`](isinf.md) | 判断浮点数是否为无穷数值。 |
| [`isNaN(): Bool`](isnan.md) | 判断浮点数是否为非数值。 |
| [`isNormal(): Bool`](isnormal.md) | 判断浮点数是否为常规数值。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Float16 <: FloatingPoint<Float16>`](extensions/extend-float16-floatingpoint-float16.md) | 为 Float16 类型扩展 FloatingPoint<Float16> 接口。 |
| [`extend Float32 <: FloatingPoint<Float32>`](extensions/extend-float32-floatingpoint-float32.md) | 为 Float32 类型扩展 FloatingPoint<Float32> 接口。 |
| [`extend Float64 <: FloatingPoint<Float64>`](extensions/extend-float64-floatingpoint-float64.md) | 为 Float64 类型扩展 FloatingPoint<Float64> 接口。 |
