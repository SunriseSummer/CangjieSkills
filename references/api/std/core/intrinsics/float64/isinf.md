<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.float64.isinf" parent="std.core.intrinsic.float64.extension.extend-float64" -->
# Float64.isInf

[← extend Float64](extensions/extend-float64.md)

## 签名

```cangjie role=signature
public func isInf(): Bool
```

判断某个浮点数 Float64 是否为无穷数值。

## 契约

返回值：

- Bool - 如果 Float64 的值正无穷大或负无穷大，则返回 `true`；否则，返回 `false`。

## 正确判断浮点数是否有限

仓颉 1.0.5 的 `Float64` 没有 `isFinite()` 成员。有限值包含零和次正规数，因此不能用 `isNormal()` 替代；应同时排除 NaN 和正负无穷。测试特殊值时可导入 `std.math`，使用该扩展提供的 `getInf()` 与 `getNaN()`。

```cangjie cjtest=run id=api.float64.finite-check.run form=unit timeout=20s
package float64_finite_check_example

import std.math.*

func isFinite(value: Float64): Bool {
    !value.isNaN() && !value.isInf()
}

main(): Unit {
    println(isFinite(0.0))
    println(isFinite(Float64.getInf()))
    println(isFinite(Float64.getNaN()))
}
```

```text cjtest=expect for=api.float64.finite-check.run stream=stdout match=exact
true
false
false
```
