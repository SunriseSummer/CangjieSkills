<!-- cj-doc kind="guide-leaf" level="5" id="language.enum.3-枚举与-equatable.overview" parent="language.enum.3-枚举与-equatable" -->
# 概述与共同规则

[← 3. 枚举与 Equatable](index.md)

枚举不会自动支持 `==`/`!=`；结构化判等优先自动派生，自定义判等则显式实现 `Equatable` 的两个操作符。

- **枚举默认不实现 `Equatable` 接口**，不能直接使用 `==` 比较枚举值
- 构造器及其负载按结构判等时，优先使用 `@Derive[Equatable]` 自动派生（须导入 `std.deriving.*`）
- 自定义相等语义时，显式声明 `enum E <: Equatable<E>`，并在枚举体内实现 `operator func ==` 和 `operator func !=`
- 比较两个枚举值的构造器组合时，`match` 的被匹配值是元组，写作 `match ((left, right))`；外层括号属于 `match` 语法，内层括号构造元组
- 不需要相等运算时，直接用 `match` 解构枚举，不要为了分支判断额外实现 `Equatable`

> `@Derive` 的精确宏签名和可派生接口请查询 API 参考中的 `std.deriving` 包。
