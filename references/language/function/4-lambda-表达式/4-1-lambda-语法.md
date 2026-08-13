<!-- cj-doc kind="guide-leaf" level="5" id="language.function.4-lambda-表达式.4-1-lambda-语法" parent="language.function.4-lambda-表达式" -->
# 4.1 Lambda 语法

[← 4. Lambda 表达式](index.md)

```cangjie cjtest=syntax id=syntax-1323223bda-1 form=stmt
let add = { a: Int64, b: Int64 =>
    a + b
}
println(add(3, 4))  // 7
```
- `=>` 分隔参数和函数体，**不可省略**（尾随 Lambda 除外）
- 函数体可以是 0~N 个表达式，多个时各占一行
- Lambda 的值/类型 = 函数体最后一个表达式的值/类型
- 无参 Lambda：`{ => exprs }`
- 参数类型可**省略**（当可从上下文推断时）
- 返回类型**始终推断**，不可显式声明

## 已验证的行级语法

下列表达式只依赖语法上下文，因此用 tree-sitter 检查是否出现 `ERROR` / `MISSING` 恢复节点：

```cangjie cjtest=syntax id=language.lambda.syntax form=expr
{ a: Int64, b: Int64 => a + b }
```
