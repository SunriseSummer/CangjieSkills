<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.unittestcase.createparameterized" parent="std.unittest.class.unittestcase" -->
# UnitTestCase.createParameterized

[← UnitTestCase](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func createParameterized<T>(String, DataStrategy<T>, Configuration, (T) -> Unit)

### 签名

```cangjie role=signature
public static func createParameterized<T>(
    name: String,
    strategy: DataStrategy<T>,
    configuration!: Configuration = Configuration(),
    body!: (T) -> Unit
): UnitTestCase
```

创建参数化的单元测试用例。

### 契约

参数：

- name: String - 用例名称。
- strategy: DataStrategy - 参数数据策略。
- configuration!: Configuration - 用例配置信息。
- body!: () -> Unit - 用例执行体。

返回值：

- UnitTestCase - 单元测试用例对象。

## static func createParameterized<T>(String, DataStrategyProcessor<T>, Configuration, (T) -> Unit)

### 签名

```cangjie role=signature
public static func createParameterized<T>(
    name: String,
    strategy: DataStrategyProcessor<T>,
    configuration!: Configuration = Configuration(),
    body!: (T) -> Unit
): UnitTestCase
```

创建参数化的单元测试用例。

### 契约

参数：

- name: String - 用例名称。
- strategy: DataStrategyProcessor - 参数数据处理器。
- configuration!: Configuration - 用例配置信息。
- body!: () -> Unit - 用例执行体。

返回值：

- UnitTestCase - 单元测试用例对象。
