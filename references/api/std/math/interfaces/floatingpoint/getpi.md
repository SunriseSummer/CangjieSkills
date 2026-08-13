<!-- cj-doc kind="api-member" level="6" id="std.math.interface.floatingpoint.getpi" parent="std.math.interface.floatingpoint" -->
# FloatingPoint<T>.getPI

[← FloatingPoint<T>](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## static func getPI()

### 签名

```cangjie role=signature
static func getPI(): T
```

获取 T 类型的圆周率常数。

### 契约

返回值：

- T - 类型 T 的圆周率常数。

## static func getPI()

适用扩展：[extend Float16 <: FloatingPoint<Float16>](extensions/extend-float16-floatingpoint-float16.md)。

### 签名

```cangjie role=signature
public static func getPI(): Float16
```

获取半精度浮点数类型的圆周率常数。

### 契约

返回值：

- Float16 - 半精度浮点数类型的圆周率常数。

## static func getPI()

适用扩展：[extend Float32 <: FloatingPoint<Float32>](extensions/extend-float32-floatingpoint-float32.md)。

### 签名

```cangjie role=signature
public static func getPI(): Float32
```

获取单精度浮点数类型的圆周率常数。

### 契约

返回值：

- Float32 - 单精度浮点数类型的圆周率常数。

## static func getPI()

适用扩展：[extend Float64 <: FloatingPoint<Float64>](extensions/extend-float64-floatingpoint-float64.md)。

### 签名

```cangjie role=signature
public static func getPI(): Float64
```

获取双精度浮点数类型的圆周率常数。

### 契约

返回值：

- Float64 - 双精度浮点数类型的圆周率常数。

## 用圆周率完成角度换算

`Float64.getPI()` 由 `std.math` 的 `FloatingPoint<Float64>` 扩展提供；导入该包后，以弧度调用三角函数。把度数换成弧度时集中封装换算公式，避免在业务代码中散落近似常量。

```cangjie cjtest=run id=api.floatingpoint.getpi.run form=unit timeout=20s
package floatingpoint_getpi_example

import std.math.*

func degreesToRadians(degrees: Float64): Float64 {
    degrees * Float64.getPI() / 180.0
}

main(): Unit {
    let straight = degreesToRadians(180.0)
    let rightAngleSine = sin(degreesToRadians(90.0))
    println(abs(straight - Float64.getPI()) < 1.0e-12)
    println(abs(rightAngleSine - 1.0) < 1.0e-12)
}
```

```text cjtest=expect for=api.floatingpoint.getpi.run stream=stdout match=exact
true
true
```
