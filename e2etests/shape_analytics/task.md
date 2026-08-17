# Shape Analytics

使用仓颉 1.1.3 新建一个名为 `shape_analytics` 的可执行 cjpm 项目，实现以下公开 API。不要修改给定测试。

## 类型

- `public abstract class Shape`
  - `public func name(): String`
  - `public func area(): Float64`
- `public class Square <: Shape`
  - `public init(side: Float64)`
  - `name()` 返回 `"square"`
  - `area()` 返回边长平方
- `public class Circle <: Shape`
  - `public init(radius: Float64)`
  - `name()` 返回 `"circle"`
  - `area()` 使用圆周率 `3.141592653589793`

`Shape` 的两个函数都必须是由子类实现的抽象函数，不提供默认函数体。

## 函数

- `public func descendingAreas(shapes: ArrayList<Shape>): ArrayList<Float64>`
  - 收集所有面积，先按升序排序，再调用 `ArrayList.reverse()` 原地反转，返回降序结果。
- `public func rootMeanSquare(values: Array<Float64>): Float64`
  - 返回平方平均值的平方根；测试输入非空。
- `public func unitDirection(angle: Float64): (Float64, Float64)`
  - 返回 `(cos(angle), sin(angle))`。
- `public func logProduct(values: Array<Float64>): Float64`
  - 用对数和计算正数数组乘积的自然对数，即 `sum(log(value))`。

## 工程与验收

- 包名必须为 `shape_analytics`，测试文件放入 `src/shape_analytics_test.cj`。
- 提供简短 `main` 演示，但不要在库函数中打印。
- 运行 `cjpm build`、`cjpm test` 和 `cjpm run`；修复全部编译错误、警告和测试失败。
