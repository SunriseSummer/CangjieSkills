<!-- cj-doc kind="guide-leaf" level="6" id="language.macro.overview.6-典型示例代码.6-7-ast-操作-遍历并修改节点" parent="language.macro.overview.6-典型示例代码" -->
# 6.7 AST 操作：遍历并修改节点

[← 6. 典型示例代码](index.md)

`class FuncCollector <: Visitor`：遍历并修改节点。

```cangjie cjtest=syntax id=syntax-563ab27be1-1 form=unit
import std.ast.FuncDecl
import std.ast.Visitor
import std.ast.parseDecl
import std.collection.ArrayList

// 查找所有函数声明并打印函数名
class FuncCollector <: Visitor {
    public var funcNames = ArrayList<String>()
    public override func visit(funcDecl: FuncDecl) {
        funcNames.add(funcDecl.identifier.value)
    }
}

main() {
    let code = quote(
        class Calc {
            func add(a: Int64, b: Int64): Int64 { a + b }
            func sub(a: Int64, b: Int64): Int64 { a - b }
        }
    )
    let decl = parseDecl(code)
    let collector = FuncCollector()
    decl.traverse(collector)
    for (name in collector.funcNames) {
        println("Found function: ${name}")
    }
    // 输出: Found function: add
    //       Found function: sub
}
```

---
