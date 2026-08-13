<!-- cj-doc kind="example-leaf" level="4" id="examples.macros.ast-call-visitor" parent="examples.macros" -->
# 遍历语法树中的调用表达式

[← 宏与语法树处理](index.md)

把内存源码解析为 Program，以 Visitor 定位 CallExpr 并识别直接调用的函数名。

## 已验证示例

先用 `cangjieLex` 和 `parseProgram` 把内存中的源码解析成 `Program`，再让 `Visitor` 遍历语法树。`CallExpr.callFunc` 是被调用表达式；直接调用普通函数时可用类型模式将它识别为 `RefExpr`。

```cangjie cjtest=run id=examples.macros.ast-call-visitor.language.ast-call-visitor.run form=unit timeout=20s
package ast_call_visitor_example

import std.ast.CallExpr
import std.ast.RefExpr
import std.ast.Visitor
import std.ast.cangjieLex
import std.ast.parseProgram

class CallVisitor <: Visitor {
    public var count: Int64 = 0
    public var callee: String = ""

    public override func visit(call: CallExpr) {
        count++
        match (call.callFunc) {
            case reference: RefExpr => callee = reference.identifier.value
            case _ => ()
        }
    }
}

main(): Unit {
    let source = "package demo\nfunc greet() { greet() }\n"
    let program = parseProgram(cangjieLex(source))
    let visitor = CallVisitor()
    program.traverse(visitor)
    println("${visitor.count}:${visitor.callee}")
}
```

预期标准输出：

```text cjtest=expect for=examples.macros.ast-call-visitor.language.ast-call-visitor.run stream=stdout match=exact
1:greet
```
