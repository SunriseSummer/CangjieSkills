<!-- cj-doc kind="api-package" level="4" id="std.deriving" parent="api.std" -->
# std.deriving

[← std 包索引](../index.md)

用 `@Derive[ToString, Hashable, Equatable, Comparable]` 为类、结构体或枚举生成所列接口的实现；字段默认参与、属性默认不参与。

包路径：`std.deriving`。在代码中只导入实际使用的类型或函数。

## 关键契约

支持范围与收集规则：

- `@Derive[...]` 只支持 `ToString`、`Hashable`、`Equatable`、`Comparable`；`Comparable` 同时生成 `Equatable` 能力，不支持用户自定义接口。
- 实例字段（含主构造函数字段）默认参与，属性默认不参与；分别用 `@DeriveExclude` 和 `@DeriveInclude` 调整。静态字段和属性始终忽略。
- 参与派生的成员不能是 `private`，其类型必须实现目标接口；被派生的 class 应为 final，不能是 `open`、`abstract` 或 `sealed`。
- `@DeriveOrder[field1, field2]` 写在所有 `@Derive` 之后，改变字段处理顺序，尤其影响 `Comparable` 的比较优先级。

## 宏

| 声明 | 功能 |
|---|---|
| [`@Derive`](macros/derive.md) | `@Derive[...]` 为类型自动生成指定接口实现；使用前导入 `std.deriving.*`，并确保字段或枚举负载也满足目标接口约束。 |
| [`@DeriveExclude`](macros/deriveexclude.md) | `DeriveExclude` 可为已被 @Derive 宏修饰的声明排除不需要处理的字段，字段默认被 Deriving 处理。 |
| [`@DeriveInclude`](macros/deriveinclude.md) | `DeriveInclude` 可为已被 @Derive 宏修饰的声明增加需要处理的属性，属性默认情况不会被 Deriving 处理。 |
| [`@DeriveOrder`](macros/deriveorder.md) | `DeriveOrder` 可为已被 @Derive 宏修饰的声明指定处理字段和属性的顺序，通常对 `Comparable` 接口有意义。 |
