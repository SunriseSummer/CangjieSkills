<!-- cj-doc kind="example-leaf" level="4" id="examples.macros.auto-to-string" parent="examples.macros" -->
# 用声明宏生成 toString 方法

[← 宏与语法树处理](index.md)

解析 class 声明、收集字段、生成成员函数，并在不适用的声明上报告编译期诊断。

## 已验证的 AutoToString 宏工程

声明宏必须位于独立的 `macro package`；主项目通过路径依赖导入宏，并在类声明前使用 `@AutoToString`。`quote` 插值 `Token` 时须精确导入 `Token` 与提供扩展的 `ToTokens`；该项目同时编译宏定义、展开调用处并核对运行输出。

根项目把宏包声明为路径依赖：

```toml cjtest=project id=examples.macros.auto-to-string.language.macro-auto-to-string file=cjpm.toml command=run timeout=120s
[package]
cjc-version = "1.1.3"
name = "auto_to_string"
version = "0.1.0"
output-type = "executable"

[dependencies]
auto_to_string_macros = { path = "./macros" }
```

宏包使用静态库输出，并启用宏编译选项：

```toml cjtest=file project=examples.macros.auto-to-string.language.macro-auto-to-string file=macros/cjpm.toml
[package]
cjc-version = "1.1.3"
name = "auto_to_string_macros"
version = "0.1.0"
output-type = "static"
compile-option = "--compile-macro"
```

宏实现先校验目标是类，再收集字段并生成 `toString` 成员：

```cangjie cjtest=file project=examples.macros.auto-to-string.language.macro-auto-to-string file=macros/src/auto_to_string.cj
macro package auto_to_string_macros

import std.ast.ClassDecl
import std.ast.DiagReportLevel
import std.ast.ToTokens
import std.ast.Token
import std.ast.Tokens
import std.ast.VarDecl
import std.ast.diagReport
import std.ast.parseDecl
import std.collection.ArrayList

public macro AutoToString(input: Tokens): Tokens {
    let declaration = parseDecl(input)
    let classDeclaration = match (declaration as ClassDecl) {
        case Some(value) => value
        case None =>
            diagReport(
                DiagReportLevel.ERROR,
                input,
                "AutoToString 只能用于 class 声明",
                "此处不是 class"
            )
            return input
    }
    let className = classDeclaration.identifier
    let fields = ArrayList<Token>()
    for (member in classDeclaration.body.decls) {
        if (let Some(field) <- (member as VarDecl)) {
            fields.add(field.identifier)
        }
    }

    var statements = quote(var result = $(className.value) + "{")
    for (field in fields) {
        let label = " " + field.value + "="
        statements = quote(
            $(statements)
            result += $(label) + this.$(field).toString()
        )
    }
    statements = quote(
        $(statements)
        result += " }"
        return result
    )

    let method = parseDecl(quote(
        public func toString(): String {
            $(statements)
        }
    ))
    classDeclaration.body.decls.add(method)
    return classDeclaration.toTokens()
}
```

应用在类声明前使用宏，生成的方法随后按普通成员调用：

```cangjie cjtest=file project=examples.macros.auto-to-string.language.macro-auto-to-string file=src/main.cj
package auto_to_string

import auto_to_string_macros.*

@AutoToString
class User {
    var name: String = ""
    var age: Int64 = 0

    init(name: String, age: Int64) {
        this.name = name
        this.age = age
    }
}

main(): Unit {
    let user = User("Alice", 30)
    println(user.toString())
}
```

预期标准输出：

```text cjtest=expect for=examples.macros.auto-to-string.language.macro-auto-to-string stream=stdout match=exact
User{ name=Alice age=30 }
```
