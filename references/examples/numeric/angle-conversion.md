<!-- cj-doc kind="example-leaf" level="4" id="examples.numeric.angle-conversion" parent="examples.numeric" -->
# 在角度与弧度之间换算

[← 数值计算与转换](index.md)

导入 std.math 扩展并使用 Float64.getPI()，集中封装度数到弧度的换算后再调用三角函数。

## 用圆周率完成角度换算

`Float64.getPI()` 由 `std.math` 的 `FloatingPoint<Float64>` 扩展提供；导入该包后，以弧度调用三角函数。把度数换成弧度时集中封装换算公式，避免在业务代码中散落近似常量。

```cangjie cjtest=run id=examples.numeric.angle-conversion.api.floatingpoint.getpi.run form=unit timeout=20s
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

预期标准输出：

```text cjtest=expect for=examples.numeric.angle-conversion.api.floatingpoint.getpi.run stream=stdout match=exact
true
true
```
