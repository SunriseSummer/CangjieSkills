<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.test" parent="std.unittest.testmacro" -->
# @Test

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@Test
```

`@Test` 宏应用于顶级函数或顶级类，使该函数或类转换为单元测试类。

## 契约

如果是顶级函数，则该函数新增一个具有单个测试用例的类提供给框架使用，同时该函数仍旧可被作为普通函数调用。

标有 `@Test` 的类必须满足以下条件：

1. 它必须有一个无参构造函数。
2. 不能从其他类继承。

> 实现说明：`@Test` 宏为任何用它标记的类引入了一个新的基类：`unittest.TestCases` 。
`unittest.TestCases` 的所有公共和受保护成员（请参阅下面的 API 概述）将在标有 `@Test` 的类或函数中变得可用，包括两个字段：
    1. 包含此测试的 `TestContext` 实例的 `ctx`。
    2. 包含类的名称的 `name` 。
单元测试框架的用户不应修改这些字段，因为这可能会导致不可预期的错误。

## 典型示例

顶层函数加 `@Test` 后会成为一个测试用例，同时仍可作为普通函数调用。测试类也可使用 `@Test`，但必须可无参构造且不能继承其他类。

相等性断言使用 `@Assert(actual, expected)` 或 `@Expect(actual, expected)`；仓颉 1.0.5 的 `std.unittest` 没有 `assertEquals` 函数。`cjpm test` 会在包的 `src` 源码目录中发现这些测试声明。

```toml cjtest=project id=api.test-macro.project file=cjpm.toml command=test timeout=60s
[package]
cjc-version = "1.0.5"
name = "test_macro_example"
version = "0.1.0"
output-type = "executable"
```

```cangjie cjtest=file project=api.test-macro.project file=src/main.cj
package test_macro_example

func clamp(value: Int64, lower: Int64, upper: Int64): Int64 {
    return max(lower, min(value, upper))
}

main(): Unit {}
```

```cangjie cjtest=file project=api.test-macro.project file=src/main_test.cj
package test_macro_example

@Test
func clampTest(): Unit {
    @Expect(clamp(-3, 0, 10), 0)
    @Expect(clamp(7, 0, 10), 7)
    @Expect(clamp(21, 0, 10), 10)
}
```
