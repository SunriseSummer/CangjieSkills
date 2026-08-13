<!-- cj-doc kind="guide-index" level="4" id="language.collections.hashmap" parent="language.collections" -->
# HashMap 类型

[← 集合类型](../index.md)

| 规则/任务 | 摘要 |
|---|---|
| [1. 概述](1-概述.md) | `HashMap<K,V>` 要求键同时满足 `Hashable` 与 `Equatable<K>`；String 等核心类型已满足，自定义 struct/class/enum 可导入 `std.deriving.*` 并用 `@Derive[Hashable, Equatable]` 生成值语义。 |
| [2. 构造](2-构造/index.md) | 子页分别说明构造函数签名。 |
| [3. 属性](3-属性.md) | `let map = HashMap<String, Int64>([("a", 1), ("b", 2)])`：属性。 |
| [4. 添加与更新](4-添加与更新/index.md) | 键不存在：插入新键值对，返回 `None` |
| [5. 查询](5-查询/index.md) | 键不存在抛出 `NoneValueException` |
| [6. 删除](6-删除/index.md) | 返回被删除的值；键不存在返回 `None` |
| [7. 遍历](7-遍历.md) | `HashMap<K, V>` 迭代元素是 `(K, V)`；用 `for ((key, value) in map)` 直接解构键值，遍历顺序不稳定，业务逻辑不得依赖输出次序。 |
| [8. 容量管理](8-容量管理.md) | `additional <= 0` 或剩余容量足够时不执行扩容 |
| [9. 判空](9-判空.md) | `func isEmpty(): Bool`：判空。 |
| [10. 拷贝](10-拷贝.md) | `func clone(): HashMap<K, V>`：拷贝。 |
| [11. 相等比较（需要 V <: Equatable<V>）](11-相等比较-需要-v.md) | `let a = HashMap<String, Int64>([("x", 1), ("y", 2)])`：相等比较（需要 V <: Equatable<V>）。 |
| [12. 转为字符串（需要 K <: ToString, V <: ToString）](12-转为字符串-需要-k-tostring-v-tostring.md) | `func toString(): String`：转为字符串（需要 K <: ToString, V <: ToString）。 |
| [13. 常见用法总结](13-常见用法总结.md) | 典型 `HashMap` 流程包括安全取值、词频统计、键值遍历、批量构造、条件删除和覆盖式合并。 |
| [14. 注意事项](14-注意事项.md) | 速查`键的要求`：`K` 必须实现 `Hashable` + `Equatable<K>`；`线程安全`：`HashMap` 非线程安全；`键不存在`：下标 `map["key"]` 在键不存在时抛 `NoneValueException`；安全方式用 `map.get("key")`；另含更多表项。 |
