<!-- cj-doc kind="api-member" level="6" id="std.unittest.interface.benchmarkconfig.warmup" parent="std.unittest.interface.benchmarkconfig" -->
# BenchmarkConfig.warmup

[← BenchmarkConfig](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func warmup(Int64)

### 签名

```cangjie role=signature
func warmup(x: Int64): Unit
```

可实现该函数，为 `@Configuration` 宏配置预热期的执行次数。

### 契约

参数：

- x: Int64 - 需配置的预热期的执行次数。

## func warmup(Duration)

### 签名

```cangjie role=signature
func warmup(x: Duration): Unit
```

可实现该函数，为 `@Configuration` 宏配置预热期的执行时间。

### 契约

参数：

- x: Int64 - 需配置的预热期的执行时间。

## func warmup(Int64)

适用扩展：[extend Configuration <: BenchmarkConfig](extensions/extend-configuration-benchmarkconfig.md)。

### 签名

```cangjie role=signature
public func warmup(x: Int64)
```

配置性能测试时预热的秒数。

### 契约

参数：

- x: Int64 - 预热的秒数。

## func warmup(Duration)

适用扩展：[extend Configuration <: BenchmarkConfig](extensions/extend-configuration-benchmarkconfig.md)。

### 签名

```cangjie role=signature
public func warmup(x: Duration)
```

配置性能测试时预热的时长。

### 契约

参数：

- x: Duration - 预热的时长。
