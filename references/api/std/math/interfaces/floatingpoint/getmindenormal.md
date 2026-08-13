<!-- cj-doc kind="api-member" level="6" id="std.math.interface.floatingpoint.getmindenormal" parent="std.math.interface.floatingpoint" -->
# FloatingPoint<T>.getMinDenormal

[← FloatingPoint<T>](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## static func getMinDenormal()

### 签名

```cangjie role=signature
static func getMinDenormal(): T
```

获取单精度浮点数的最小次正规数。

### 契约

返回值：

- T - 类型 T 的最小次正规数。

## static func getMinDenormal()

适用扩展：[extend Float16 <: FloatingPoint<Float16>](extensions/extend-float16-floatingpoint-float16.md)。

### 签名

```cangjie role=signature
public static func getMinDenormal(): Float16
```

获取半精度浮点数类型的最小次正规数。

### 契约

返回值：

- Float16 - 半精度浮点数类型的最小次正规数。

## static func getMinDenormal()

适用扩展：[extend Float32 <: FloatingPoint<Float32>](extensions/extend-float32-floatingpoint-float32.md)。

### 签名

```cangjie role=signature
public static func getMinDenormal(): Float32
```

获取单精度浮点数类型的最小次正规数。

### 契约

返回值：

- Float32 - 单精度浮点数类型的最小次正规数。

## static func getMinDenormal()

适用扩展：[extend Float64 <: FloatingPoint<Float64>](extensions/extend-float64-floatingpoint-float64.md)。

### 签名

```cangjie role=signature
public static func getMinDenormal(): Float64
```

获取双精度浮点数类型的最小次正规数。

### 契约

返回值：

- Float64 - 双精度浮点数类型的最小次正规数。
