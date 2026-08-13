<!-- cj-doc kind="guide-leaf" level="6" id="language.macro.overview.4-std-ast-包与语法节点.4-6-visitor-遍历模式" parent="language.macro.overview.4-std-ast-包与语法节点" -->
# 4.6 Visitor 遍历模式

[← 4. std.ast 包与语法节点](index.md)

继承 `Visitor` 并覆盖目标节点类型的 `visit`，再调用 `node.traverse(visitor)` 遍历；需要停止当前子树时调用 `breakTraverse()`。

```cangjie cjtest=syntax id=syntax-6cb0d4954d-1 form=unit
import std.ast.VarDecl
import std.ast.Visitor

class MyVisitor <: Visitor {
    public override func visit(varDecl: VarDecl) {
        println("Found var: ${varDecl.identifier.value}")
        breakTraverse()  // 不继续遍历子节点
        return
    }
}

// 使用方式：node.traverse(MyVisitor())
```

## 已验证示例

先用 `cangjieLex` 和 `parseProgram` 把内存中的源码解析成 `Program`，再让 `Visitor` 遍历语法树。`CallExpr.callFunc` 是被调用表达式；直接调用普通函数时可用类型模式将它识别为 `RefExpr`。

```cangjie cjtest=run id=language.ast-call-visitor.run form=unit timeout=20s
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

```text cjtest=expect for=language.ast-call-visitor.run stream=stdout match=exact
1:greet
```
