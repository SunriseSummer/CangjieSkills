<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.benchmark.createparameterized" parent="std.unittest.class.benchmark" -->
# Benchmark.createParameterized

[← Benchmark](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func createParameterized<T>(String, DataStrategy<T>, Configuration, Measurement, (T) -> Unit)

### 签名

```cangjie role=signature
public static func createParameterized<T>(
    name: String,
    strategy: DataStrategy<T>,
    configuration!: Configuration = Configuration(),
    measurement!: Measurement = TimeNow(),
    body!: (T) -> Unit
): Benchmark
```

创建一个参数化的性能测试用例对象。

### 契约

参数：

- name: String - 用例名称。
- strategy: DataStrategy - 参数数据策略。
- configuration: Configuration - 用例配置信息。
- measurement!: Measurement 测量方法信息。
- body: () -> Unit - 用例执行体。

返回值：

- Benchmark - 性能测试用例对象。

## static func createParameterized<T>(String, DataStrategyProcessor<T>, Configuration, Measurement, (T) -> Unit)

### 签名

```cangjie role=signature
public static func createParameterized<T>(
    name: String,
    strategy: DataStrategyProcessor<T>,
    configuration!: Configuration = Configuration(),
    measurement!: Measurement = TimeNow(),
    body!: (T) -> Unit
): Benchmark
```

创建一个参数化的性能测试用例对象。

### 契约

参数：

- name: String - 用例名称。
- strategy: DataStrategyProcessor - 参数数据处理器。
- configuration: Configuration - 用例配置信息。
- measurement: Measurement - 测量方法信息。
- body: () -> Unit - 用例执行体。

返回值：

- Benchmark - 性能测试用例对象。
