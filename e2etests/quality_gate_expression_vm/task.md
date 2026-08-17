# 表达式虚拟机与仓颉质量门禁

使用仓颉 1.1.3 创建名为 `quality_gate_expression_vm` 的可执行 cjpm 项目，实现下列 API，并提供可重复执行的跨平台 `quality.py`。不得修改给定 `.cj` 测试或 `accept.py`。

## 公开 API

```cangjie
public enum Expr {
    | Num(Int64) | Add(Expr, Expr) | Sub(Expr, Expr) | Mul(Expr, Expr)
    | Div(Expr, Expr) | Neg(Expr) | Var(String) | IfZero(Expr, Expr, Expr)
}
public class VmException <: Exception {
    public init(message: String)
}
public class Environment {
    public init()
    public func put(name: String, value: Int64): Environment
    public func contains(name: String): Bool
    public func value(name: String): Int64
}
public func evaluate(expr: Expr, env!: Environment = Environment()): Int64
public func nodeCount(expr: Expr): Int64
public func depth(expr: Expr): Int64
public func render(expr: Expr): String
```

- 运算使用 `Int64` 常规语义；除数为 0 抛 `VmException("division by zero")`。
- 未定义变量抛 `VmException("undefined variable: <name>")`。
- `IfZero(test, yes, no)` 只求值所选分支。
- `render` 输出完全括号化形式：数字原样；变量为名称；一元负号 `(-x)`；二元运算如 `(a + b)`；条件为 `(if0 test then yes else no)`。
- `nodeCount` 统计所有枚举节点；叶子深度为 1，组合节点深度为 1 加子节点最大深度。

## quality.py

脚本从项目根运行并满足：

1. `cjpm clean/build/test`，测试开启 coverage 并生成 XML 测试报告；
2. `cjfmt` 只格式化到 `reports/formatted`，不得改写 `src`；
3. `cjlint` 生成 CSV 报告；
4. `cjcov` 在 `reports/coverage` 生成 HTML 明细、XML 与 JSON；
5. 任一命令失败或预期文件缺失时以非零状态退出；可连续执行两次。

把 `quality_gate_expression_vm_test.cj` 原样放入 `src/`，最后运行 `python accept.py`。
