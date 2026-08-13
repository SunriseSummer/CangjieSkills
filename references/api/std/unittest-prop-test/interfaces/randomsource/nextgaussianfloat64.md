<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.nextgaussianfloat64" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.nextGaussianFloat64

[← RandomSource](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func nextGaussianFloat64(Float64, Float64)

### 签名

```cangjie role=signature
public func nextGaussianFloat64(mean!: Float64 = 0.0, sigma!: Float64 = 1.0): Float64
```

获取一个 Float64 类型的符合指定均值与标准差的高斯分布的随机数。

### 契约

默认获取一个 Float64 类型且符合均值为 0.0 标准差为 1.0 的高斯分布的随机数。其中均值是期望值，可解释为位置参数，决定了分布的位置，标准差可解释为尺度参数，决定了分布的幅度。此函数调用了函数 `nextGaussianFloat64Implement` 得到返回值，所以当子类继承 Random 并覆写 `nextGaussianFloat64Implement` 函数时，调用子类的该函数将会返回覆写的函数的返回值。

参数：

- mean!: Float64 - 均值，默认值 0.0。
- sigma!: Float64 - 标准差，默认值 1.0。

返回值：

- Float64 - 一个 Float64 类型的随机数。

## func nextGaussianFloat64(Float64, Float64)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public func nextGaussianFloat64(mean!: Float64 = 0.0, sigma!: Float64 = 1.0): Float64
```

获取一个 Float64 类型的符合指定均值与标准差的高斯分布的随机数。

### 契约

默认获取一个 Float64 类型且符合均值为 0.0 标准差为 1.0 的高斯分布的随机数。其中均值是期望值，可解释为位置参数，决定了分布的位置，标准差可解释为尺度参数，决定了分布的幅度。此函数调用了函数 `nextGaussianFloat64Implement` 得到返回值，所以当子类继承 Random 并覆写 `nextGaussianFloat64Implement` 函数时，调用子类的该函数将会返回覆写的函数的返回值。

参数：

- mean!: Float64 - 均值，默认值 0.0。
- sigma!: Float64 - 标准差，默认值 1.0。

返回值：

- Float64 - 一个 Float64 类型的随机数。
