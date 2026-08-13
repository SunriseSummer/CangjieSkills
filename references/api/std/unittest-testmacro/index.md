<!-- cj-doc kind="api-package" level="4" id="std.unittest.testmacro" parent="api.std" -->
# std.unittest.testmacro

[← std 包索引](../index.md)

单元测试框架提供了用户所需的宏。

包路径：`std.unittest.testmacro`。在代码中只导入实际使用的类型或函数。

## 宏

| 声明 | 功能 |
|---|---|
| [`@AfterAll`](macros/afterall.md) | 声明测试类中的函数为测试生命周期函数。 |
| [`@AfterEach`](macros/aftereach.md) | 声明测试类中的函数为测试生命周期函数。 |
| [`@Assert`](macros/assert.md) | `@Assert` 声明 Assert 断言，测试函数内部使用，断言失败停止用例。 |
| [`@AssertThrows`](macros/assertthrows.md) | 声明预期异常的断言，测试函数内部使用，断言失败停止用例。 |
| [`@BeforeAll`](macros/beforeall.md) | 声明测试类中的函数为测试生命周期函数。 |
| [`@BeforeEach`](macros/beforeeach.md) | 声明测试类中的函数为测试生命周期函数。 |
| [`@Bench`](macros/bench.md) | `@Bench` 宏用于标记要执行多次的函数并计算该函数的预期执行时间。 |
| [`@Configure`](macros/configure.md) | `@Configure` 宏为测试类或测试函数提供配置参数。 |
| [`@CustomAssertion`](macros/customassertion.md) | `@CustomAssertions` 将函数指定为用户自定义断言。 |
| [`@Expect`](macros/expect.md) | `@Expect` 声明 Expect 断言，测试函数内部使用，断言失败继续执行用例。 |
| [`@ExpectThrows`](macros/expectthrows.md) | 声明预期异常的断言，测试函数内部使用，断言失败继续执行用例。 |
| [`@Fail`](macros/fail.md) | 声明预期失败的断言，测试函数内部使用，断言失败停止用例。 |
| [`@FailExpect`](macros/failexpect.md) | 声明预期失败的断言，测试函数内部使用，断言失败继续执行用例。 |
| [`@Measure`](macros/measure.md) | 用于为性能测试指定 Measurement 实例。 |
| [`@Parallel`](macros/parallel.md) | `@Parallel` 宏可以修饰测试类。 |
| [`@PowerAssert`](macros/powerassert.md) | 1. `@PowerAssert(leftExpr, rightExpr)` ，比较 `leftExpr` 和 `rightExpr` 值是否相同。 |
| [`@Skip`](macros/skip.md) | `@Skip` 修饰已经被 `@TestCase` / `@Bench` 修饰的函数，使该测试用例被跳过。 |
| [`@Strategy`](macros/strategy.md) | 在函数上使用 `@Strategy` 可从该函数创建新的 DataStrategy 。 |
| [`@Tag`](macros/tag.md) | `@Tag` 宏可以应用于 `@Test` 类和 `@Test` 或 `@TestCase` 或 `@Bench` 函数，提供测试实体的元信息。 |
| [`@Test`](macros/test.md) | `@Test` 宏应用于顶级函数或顶级类，使该函数或类转换为单元测试类。 |
| [`@TestBuilder`](macros/testbuilder.md) | 声明一个动态测试套。 |
| [`@TestCase`](macros/testcase.md) | `@TestCase` 宏用于标记单元测试类内的函数，使这些函数成为单元测试的测试用例。 |
| [`@TestTemplate`](macros/testtemplate.md) | `@TestTemplate` 宏可修饰抽象类，使得它成为一个测试模版。 |
| [`@Timeout`](macros/timeout.md) | `@Timeout` 指示测试应在指定时间后终止。 |
| [`@Types`](macros/types.md) | `@Types` 宏为测试类或测试函数提供类型参数。 |
| [`@UnittestOption`](macros/unittestoption.md) | 该宏可用于注册自定义配置项。 |
