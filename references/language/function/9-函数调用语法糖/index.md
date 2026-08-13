<!-- cj-doc kind="guide-index" level="4" id="language.function.9-函数调用语法糖" parent="language.function" -->
# 9. 函数调用语法糖

[← 函数与 Lambda](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [9.1 尾随 Lambda](9-1-尾随-lambda.md) | 在尾随 Lambda 位置，`=>` 可省略 |
| [9.2 管道运算符 `\|>`](9-2-管道运算符.md) | `e1 \|> e2` 等价于 `let v = e1; e2(v)` |
| [9.3 组合运算符 `~>`](9-3-组合运算符.md) | `f ~> g` 等价于 `{ x => g(f(x)) }` |
| [9.4 变长参数](9-4-变长参数.md) | 仅最后一个非命名参数可变长。 |
