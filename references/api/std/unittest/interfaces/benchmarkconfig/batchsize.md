<!-- cj-doc kind="api-member" level="6" id="std.unittest.interface.benchmarkconfig.batchsize" parent="std.unittest.interface.benchmarkconfig" -->
# BenchmarkConfig.batchSize

[← BenchmarkConfig](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func batchSize(Int64)

### 签名

```cangjie role=signature
func batchSize(b: Int64): Unit
```

可实现该函数，为 `@Configuration` 宏配置批次的大小。

### 契约

参数：

- b: Int64 - 需配置的批次大小值。

## func batchSize(Range<Int64>): Unit

### 签名

```cangjie role=signature
func batchSize(x: Range<Int64>): Unit
```

可实现该函数，为 `@Configuration` 宏配置批次的大小。

### 契约

参数：

- x: Range<Int64> - 需配置的批次大小范围值。

## func batchSize(Int64)

适用扩展：[extend Configuration <: BenchmarkConfig](extensions/extend-configuration-benchmarkconfig.md)。

### 签名

```cangjie role=signature
public func batchSize(b: Int64)
```

配置性能测试时一个批次的执行次数。

### 契约

参数：

- b: Int64 - 执行次数。

## func batchSize(Range<Int64>)

适用扩展：[extend Configuration <: BenchmarkConfig](extensions/extend-configuration-benchmarkconfig.md)。

### 签名

```cangjie role=signature
public func batchSize(x: Range<Int64>)
```

配置性能测试时一个批次的执行次数范围。

### 契约

参数：

- b: Range\<Int64> - 执行次数范围。
