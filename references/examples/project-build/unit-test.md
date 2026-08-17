<!-- cj-doc kind="example-leaf" level="4" id="examples.project-build.unit-test" parent="examples.project-build" -->
# 组织并运行单元测试

[← 项目构建与测试](index.md)

`std.unittest` 的 `@Test` / `@TestCase` 使用 `@Assert(actual, expected)` 或 `@Expect(actual, expected)` 做相等性断言；没有 `assertEquals` 函数。

## 典型示例

顶层函数加 `@Test` 后会成为一个测试用例，同时仍可作为普通函数调用。测试类也可使用 `@Test`，但必须可无参构造且不能继承其他类。

相等性断言使用 `@Assert(actual, expected)` 或 `@Expect(actual, expected)`；仓颉 1.1.3 的 `std.unittest` 没有 `assertEquals` 函数。`cjpm test` 会在包的 `src` 源码目录中发现这些测试声明。

`@Assert`/`@Expect` 的相等性重载要求被比较类型实现 `Equatable<T>`。元组虽然在各元素可比较时支持 `==`，但 Tuple 本身不能实现接口，因此不能直接传给相等性断言；应先保存结果，再逐个下标断言元素。

```toml cjtest=project id=examples.project-build.unit-test.api.test-macro.project file=cjpm.toml command=test timeout=60s
[package]
cjc-version = "1.1.3"
name = "test_macro_example"
version = "0.1.0"
output-type = "executable"
```

仓颉源码 `src/main.cj`：

```cangjie cjtest=file project=examples.project-build.unit-test.api.test-macro.project file=src/main.cj
package test_macro_example

func clamp(value: Int64, lower: Int64, upper: Int64): Int64 {
    return max(lower, min(value, upper))
}

main(): Unit {}
```

仓颉源码 `src/main_test.cj`：

```cangjie cjtest=file project=examples.project-build.unit-test.api.test-macro.project file=src/main_test.cj
package test_macro_example

@Test
func clampTest(): Unit {
    @Expect(clamp(-3, 0, 10), 0)
    @Expect(clamp(7, 0, 10), 7)
    @Expect(clamp(21, 0, 10), 10)
}
```
