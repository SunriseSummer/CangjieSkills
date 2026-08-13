<!-- cj-doc kind="api-member" level="6" id="std.unittest.interface.benchmarkconfig.minduration" parent="std.unittest.interface.benchmarkconfig" -->
# BenchmarkConfig.minDuration

[← BenchmarkConfig](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func minDuration(Duration)

### 签名

```cangjie role=signature
func minDuration(x: Duration): Unit
```

可实现该函数，为 `@Configuration` 宏配置性能测试最小执行时间。

### 契约

参数：

- x: Int64 - 需配置的性能测试最小执行时间。

## func minDuration(Duration)

适用扩展：[extend Configuration <: BenchmarkConfig](extensions/extend-configuration-benchmarkconfig.md)。

### 签名

```cangjie role=signature
public func minDuration(x: Duration)
```

配置性能测试时最短的执行时长。

### 契约

参数：

- x: Duration - 最短的执行时长。
