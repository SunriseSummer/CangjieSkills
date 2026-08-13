<!-- cj-doc kind="api-member" level="6" id="std.unittest.interface.benchmarkconfig.explicitgc" parent="std.unittest.interface.benchmarkconfig" -->
# BenchmarkConfig.explicitGC

[← BenchmarkConfig](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func explicitGC(ExplicitGcType)

### 签名

```cangjie role=signature
func explicitGC(x: ExplicitGcType): Unit
```

可实现该函数，为 `@Configuration` 宏配置 GC 的类型。

### 契约

参数：

- x: ExplicitGcType - 需配置的 GC 类型值。

## func explicitGC(ExplicitGcType)

适用扩展：[extend Configuration <: BenchmarkConfig](extensions/extend-configuration-benchmarkconfig.md)。

### 签名

```cangjie role=signature
public func explicitGC(x: ExplicitGcType)
```

配置性能测试时执行 GC 的方式。

### 契约

参数：

- x: ExplicitGcType - GC 执行的方式。
