<!-- cj-doc kind="example-leaf" level="4" id="examples.macros.multi-statement-codegen" parent="examples.macros" -->
# 在宏中安全生成多条语句

[← 宏与语法树处理](index.md)

固定结构用 quote；拼接独立 Tokens 时插入 TokenKind.NL，动态源码经 cangjieLex 转换时显式保留换行。

## 已验证的多语句宏生成

宏展开结果是词法单元序列，拼接两条独立语句时不能依赖字符串连接或排版“碰巧”产生分隔。固定结构优先用 `quote`；若组合多段 `Tokens`，显式插入 `Token(TokenKind.NL)`。只有结构高度动态时才用 `cangjieLex`，并在源码字符串中明确写出每个 `\n`。

根项目引用独立宏包：

```toml cjtest=project id=examples.macros.multi-statement-codegen.language.macro-multi-statement file=cjpm.toml command=run timeout=90s
[package]
cjc-version = "1.1.3"
name = "macro_statement_codegen"
version = "0.1.0"
output-type = "executable"

[dependencies]
statement_macros = { path = "./macros" }
```

宏包启用宏编译：

```toml cjtest=file project=examples.macros.multi-statement-codegen.language.macro-multi-statement file=macros/cjpm.toml
[package]
cjc-version = "1.1.3"
name = "statement_macros"
version = "0.1.0"
output-type = "static"
compile-option = "--compile-macro"
```

第一种实现用 `TokenKind.NL` 连接两段固定结构；第二种实现把带显式换行的动态源码交给 `cangjieLex`：

```cangjie cjtest=file project=examples.macros.multi-statement-codegen.language.macro-multi-statement file=macros/src/statements.cj
macro package statement_macros

import std.ast.ToTokens
import std.ast.Token
import std.ast.TokenKind
import std.ast.Tokens
import std.ast.cangjieLex

public macro TwiceByTokens(input: Tokens): Tokens {
    let body = quote(let value = ($(input))) +
        Token(TokenKind.NL) +
        quote(value * 2)
    return quote({ =>
        $(body)
    }())
}

public macro TwiceByLex(input: Tokens): Tokens {
    let source = "{ =>\n" +
        "let value = (" + input.toString() + ")\n" +
        "value * 2\n" +
        "}()"
    return cangjieLex(source)
}
```

应用像调用普通表达式一样使用两个宏：

```cangjie cjtest=file project=examples.macros.multi-statement-codegen.language.macro-multi-statement file=src/main.cj
package macro_statement_codegen

import statement_macros.*

main(): Unit {
    println(@TwiceByTokens(21))
    println(@TwiceByLex(22))
}
```

预期标准输出：

```text cjtest=expect for=examples.macros.multi-statement-codegen.language.macro-multi-statement stream=stdout match=exact
42
44
```
