<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.datastrategyprocessor.intounittestcase" parent="std.unittest.class.datastrategyprocessor" -->
# DataStrategyProcessor<T>.intoUnitTestCase

[← DataStrategyProcessor<T>](index.md)

## 签名

```cangjie role=signature
public func intoUnitTestCase(
    caseName!: String,
    configuration!: Configuration,
    doRun!: (T) -> Unit
): UnitTestCase
```

宏生成的代码使用的辅助函数。

## 契约

功能：宏生成的代码使用的辅助函数。用于创建使用该策略的测试用例。

参数：

- caseName!: String - 用例名称。
- configuration!: Configuration - 配置信息。
- doRun!: (T) -> Unit - 性能测试用例执行体。

返回值：

- UnitTestCase - 测试用例对象。
