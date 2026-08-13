<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.tag" parent="std.unittest.testmacro" -->
# @Tag

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@Tag
```

`@Tag` 宏可以应用于 `@Test` 类和 `@Test` 或 `@TestCase` 或 `@Bench` 函数，提供测试实体的元信息。

## 契约

`@Tag` 宏可以应用于 `@Test` 类和 `@Test` 或 `@TestCase` 或 `@Bench` 函数，提供测试实体的元信息。后续可以通过 `--include-tags` 和 `--exclude-tags` 运行选项过滤带有这些标签的测试实体。

### 支持的语法

1. 单个 `@Tag` 在测试函数上。

等同于：
