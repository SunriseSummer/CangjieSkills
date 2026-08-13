<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.unittestcase" parent="std.unittest" -->
# UnitTestCase

[← std.unittest](../../index.md)

`UnitTestCase`

提供创建和执行单元测试用例的方法的类。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`name: String`](prop-name.md) | 获取单元测试名称。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`run(): TestReport`](run.md) | 运行单元测试用例。 |
| [`static create( name: String, configuration!: Configuration = Configuration(), body!: () -> Unit ): UnitTestCase`](create.md) | 创建单元测试用例。 |
| [`static createParameterized<T>( name: String, strategy: DataStrategy<T>, configuration!: Configuration = Configuration(), body!: (T) -> Unit ): UnitTestCase`](createparameterized.md) | 创建参数化的单元测试用例。 |
| [`static createParameterized<T>( name: String, strategy: DataStrategyProcessor<T>, configuration!: Configuration = Configuration(), body!: (T) -> Unit ): UnitTestCase`](createparameterized.md) | 创建参数化的单元测试用例。 |
