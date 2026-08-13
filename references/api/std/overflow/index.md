<!-- cj-doc kind="api-package" level="4" id="std.overflow" parent="api.std" -->
# std.overflow

[← std 包索引](../index.md)

提供了整数运算溢出时的处理能力。

包路径：`std.overflow`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`OvershiftException <: Exception`](classes/overshiftexception/index.md) | 移位运算中，当移位位数超过操作数位数时抛出的异常。 |
| [`UndershiftException <: Exception`](classes/undershiftexception/index.md) | 移位运算中，当移位位数小于 0 时抛出的异常。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`CarryingOp<T>`](interfaces/carryingop/index.md) | 提供返回整数运算是否发生了截断以及运算结果的接口。 |
| [`CarryingPow`](interfaces/carryingpow/index.md) | 提供使用 wrapping 策略的幂运算接口。 |
| [`CheckedOp<T>`](interfaces/checkedop/index.md) | 当整数运算出现溢出，返回 `None`。 |
| [`CheckedPow`](interfaces/checkedpow/index.md) | 提供返回 Option 策略的幂运算接口。 |
| [`SaturatingOp<T>`](interfaces/saturatingop/index.md) | 当整数运算出现溢出，饱和处理。 |
| [`SaturatingPow`](interfaces/saturatingpow/index.md) | 提供饱和策略的幂运算接口。 |
| [`ThrowingOp<T>`](interfaces/throwingop/index.md) | 当整数运算出现溢出，抛出异常。 |
| [`ThrowingPow`](interfaces/throwingpow/index.md) | 提供使用抛出异常策略的幂运算接口。 |
| [`WrappingOp<T>`](interfaces/wrappingop/index.md) | 当整数运算出现溢出，高位截断。 |
| [`WrappingPow`](interfaces/wrappingpow/index.md) | 提供使用高位截断策略的幂运算接口。 |
