<!-- cj-doc kind="guide-index" level="5" id="language.macro.overview.6-典型示例代码" parent="language.macro.overview" -->
# 6. 典型示例代码

[← 总览与通用规则](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [6.1 快速幂（编译时代码生成）](6-1-快速幂-编译时代码生成.md) | 属性宏 `@power[10](n)` 在编译时展开幂运算循环 |
| [6.2 记忆化（自动缓存）](6-2-记忆化-自动缓存.md) | `@Memoize[true]` 将递归函数转换为使用 `HashMap` 缓存结果 |
| [6.3 扩展 dprint（多表达式打印）](6-3-扩展-dprint-多表达式打印.md) | `@dprint2(x, y, x + y)` 打印多个逗号分隔的表达式 |
| [6.4 简单 DSL（类 LINQ 查询）](6-4-简单-dsl-类-linq-查询.md) | `@linq(from x in 1..=10 where x % 2 == 1 select x * x)` 实现迷你查询语言 |
| [6.5 非属性宏：自动生成 toString](6-5-非属性宏-自动生成-tostring.md) | 宏定义（`macros/src/my_macros.cj`）。 |
| [6.6 属性宏：条件日志](6-6-属性宏-条件日志.md) | 属性宏可读取属性参数并重写所修饰的函数体；示例在函数入口插入固定格式的日志语句。 |
| [6.7 AST 操作：遍历并修改节点](6-7-ast-操作-遍历并修改节点.md) | `class FuncCollector <: Visitor`：遍历并修改节点。 |
