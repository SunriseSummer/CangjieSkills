<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.testcase" parent="std.unittest.testmacro" -->
# @TestCase

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@TestCase
```

`@TestCase` 宏用于标记单元测试类内的函数，使这些函数成为单元测试的测试用例。

## 契约

标有 `@TestCase` 的函数必须满足以下条件：

1. 该类必须用 `@Test` 标记。
2. 该函数返回类型必须是 Unit 。

测试用例可能有参数，在这种情况下，开发人员必须使用参数化测试 DSL 指定这些参数的值：

此 DSL 可用于 `@Test`、`@Strategy`、`@Bench` 和 `@TestCase` 宏，其中 `@Test` 仅在顶级函数上时才可用。如果测试函数中同时存在 `@Bench` 和 `@TestCase` ，则只有 `@Bench` 可以包含 DSL 。
在 DSL 语法中，`in` 之前的标识符（在上面的示例中为 `x` 、`y` 和 `z` ）必须直接对应于函数的参数，参数源（在上面的示例中为`source1` 、`source2` 和 `source3`）是任何有效的仓颉表达式（该表达式类型必须实现接口 DataStrategy\<T> 或 DataStrategyProcessor\<T>，详见下文）。
参数源的元素类型（此类型作为泛型参数 `T` 提供给接口 DataStrategy\<T> ）必须与相应函数参数的类型严格相同。

支持的参数源类型如下：

- Arrays: `x in [1,2,3,4]` 。
- Ranges: `x in 0..14` 。
- 随机生成的值：`x in random()` 。
- 从 json 文件中读取到的值：`x in json("filename.json")` 。
- 从 csv 文件中读取到的值：`x in csv("filename.csv")` 。
- `@Strategy` 修饰的函数：`x in nameOfStrategyAnnotatedFunction` 。
- 使用 DataStrategyProcessor 组合数据策略的结果。

> 高级用户可以通过定义自己的类型并且实现 DataStrategy\<T> 接口来引入自己的参数源类型。

使用 `random()` 的随机生成函数默认支持以下类型：

- Unit
- Bool
- 所有内置的 integer 类型（包含有符号和无符号）
- 所有内置的 float 类型
- Ordering
- 所有已支持类型的数组类型
- 所有已支持类型的 Option 类型

> 若需要新增其他的类型支持 `random()` ，可以让该类型扩展 Arbitrary 。
> 在参数有多个值时，`beforeEach` / `afterEach` 不会在不同值下重复执行而仅会执行一次。若确实需要在每个值下做初始化和去初始化，需要在测试主体中写。对于性能测试方案， `@Strategy` 应该用于需要从基准中排除的设置代码。没有为这种情况提供特殊的 API，因为在大多数情况下，这样的代码依赖于特定的参数值。
