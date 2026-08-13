<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.datastrategyprocessor.start" parent="std.unittest.class.datastrategyprocessor" -->
# DataStrategyProcessor<T>.start

[← DataStrategyProcessor<T>](index.md)

本页汇总 5 个同名重载；先按签名选择，再读取对应契约。

## static func start(DataStrategy<T>, String)

### 签名

```cangjie role=signature
public static func start(s: DataStrategy<T>, name: String): SimpleProcessor<T>
```

DataStrategy 的组合和映射的起点。

### 契约

参数：

- s: DataStrategy\<T> - 数据策略。
- name: String - 用例名称。

返回值：

- SimpleProcessor\<T> - 测试用例处理器。

## static func start<U>(() -> DataStrategy<U>, String)

### 签名

```cangjie role=signature
public static func start<U>(
    f: () -> DataStrategy<U>,
    name: String
): DataStrategyProcessor<U> where U <: BenchInputProvider < T >
```

DataStrategy 的组合和映射的起点。

### 契约

参数：

- s: () -> DataStrategy\<U> - 生成数据策略的闭包。
- name: String - 用例名称。

返回值：

- DataStrategyProcessor\<T> - 数据策略处理器。

## static func start(() -> DataStrategy<T>, String, Int64)

### 签名

```cangjie role=signature
public static func start(
    f: () -> DataStrategy<T>,
    name: String,
    x!: Int64 = 0
): SimpleProcessor<T>
```

DataStrategy 的组合和映射的起点。

### 契约

参数：

- s: () -> DataStrategy\<T> - 生成数据策略的闭包。
- name: String - 用例名称。
- x!: Int64 - 为实现不同返回值的重构增加的参数。

返回值：

- SimpleProcessor\<T> - 测试用例处理器。

## static func start(() -> DataStrategyProcessor<T>, String)

### 签名

```cangjie role=signature
public static func start(f: () -> DataStrategyProcessor<T>, name: String): DataStrategyProcessor<T>
```

DataStrategy 的组合和映射的起点。

### 契约

参数：

- s: () -> DataStrategyProcessor\<T> - 生成数据策略处理器的闭包。
- name: String - 用例名称。

返回值：

- DataStrategyProcessor\<T> - 数据策略处理器。

## static func start<U>(() -> DataStrategyProcessor<U>, String, Int64)

### 签名

```cangjie role=signature
public static func start<U>(
    f: () -> DataStrategyProcessor<U>,
    name: String,
    x!: Int64 = 0
): DataStrategyProcessor<U> where U <: BenchInputProvider<T>
```

DataStrategy 的组合和映射的起点。

### 契约

参数：

- s: () -> DataStrategyProcessor\<U> - 生成数据策略处理器的闭包。
- name: String - 用例名称。
- x!: Int64 - 为实现不同返回值的重构增加的参数。

返回值：

- DataStrategyProcessor\<U> where U <: BenchInputProvider\<T> - 数据策略处理器。
