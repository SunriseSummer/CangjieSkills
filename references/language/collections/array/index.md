<!-- cj-doc kind="guide-index" level="4" id="language.collections.array" parent="language.collections" -->
# Array 类型

[← 集合类型](../index.md)

| 规则/任务 | 摘要 |
|---|---|
| [1. 概述](1-概述.md) | `Array<T>` 是仓颉核心包 `std.core` 中的 struct 类型，无需导入 即可直接使用。 |
| [2. 构造](2-构造/index.md) | `size < 0` 时抛出 `NegativeArraySizeException` |
| [3. 属性](3-属性.md) | `let arr = [10, 20, 30]`：属性。 |
| [4. 元素访问与修改](4-元素访问与修改/index.md) | 索引从 `0` 开始，类型为 `Int64` |
| [5. 切片与分割](5-切片与分割/index.md) | 注意：范围下标返回的是原数组的引用切片，修改会反映到原数组。 |
| [6. 拼接与重复](6-拼接与重复/index.md) | 子页分别说明concat — 拼接、repeat — 重复。 |
| [7. 拷贝](7-拷贝/index.md) | 子页分别说明clone — 深拷贝、copyTo — 拷贝到目标数组。 |
| [8. 填充与反转](8-填充与反转/index.md) | 子页分别说明fill — 用指定值填充全部元素、reverse — 原地反转。 |
| [9. 映射与扁平化](9-映射与扁平化/index.md) | 子页分别说明map — 元素映射、flatten — 扁平化二维数组。 |
| [10. 搜索与查找（需要 T <: Equatable<T>）](10-搜索与查找-需要-t/index.md) | 以下方法需要元素类型 `T` 实现 `Equatable<T>` 接口。 |
| [11. 相等比较（需要 T <: Equatable<T>）](11-相等比较-需要-t.md) | `let a = [1, 2, 3]`：相等比较（需要 T <: Equatable<T>）。 |
| [12. 转为字符串（需要 T <: ToString）](12-转为字符串-需要-t-tostring.md) | `func toString(): String`：转为字符串（需要 T <: ToString）。 |
| [13. 迭代](13-迭代.md) | `func iterator(): Iterator<T>`：迭代。 |
| [14. 排序（使用 std.sort）](14-排序-使用-std-sort.md) | Array 本身不提供排序方法，需导入 `std.sort`。 |
| [15. 常见用法总结](15-常见用法总结.md) | 典型数组流程包括定长初始化、下标修改、映射、查找、拼接、扁平化、克隆和按位置分割。 |
