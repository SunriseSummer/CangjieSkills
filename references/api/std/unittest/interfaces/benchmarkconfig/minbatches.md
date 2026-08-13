<!-- cj-doc kind="api-member" level="6" id="std.unittest.interface.benchmarkconfig.minbatches" parent="std.unittest.interface.benchmarkconfig" -->
# BenchmarkConfig.minBatches

[← BenchmarkConfig](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func minBatches(Int64)

### 签名

```cangjie role=signature
func minBatches(x: Int64): Unit
```

可实现该函数，为 `@Configuration` 宏配置最小批次个数。

### 契约

参数：

- Int64 - 需配置的最小批次个数。

## func minBatches(Int64)

适用扩展：[extend Configuration <: BenchmarkConfig](extensions/extend-configuration-benchmarkconfig.md)。

### 签名

```cangjie role=signature
public func minBatches(x: Int64)
```

配置性能测试时最少的批次数。

### 契约

参数：

- x: Int64 - 最少的批次数。
