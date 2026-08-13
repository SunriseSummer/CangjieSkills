<!-- cj-doc kind="example-leaf" level="4" id="examples.macros.macro-package" parent="examples.macros" -->
# 宏包的开发、引用和编译

[← 宏与语法树处理](index.md)

以独立 macro package、路径依赖、--compile-macro 和 quote 插值组成完整双模块工程。

## 已验证的最小宏工程

声明宏（发布文档称“非属性宏”）必须放在独立的 `macro package`。宏模块以静态库输出并传入 `--compile-macro`，主项目再用路径依赖导入；`quote` 是关键字，`$(input)` 把调用处 `Tokens` 插入展开结果。启用 `quote` 插值扩展时精确导入 `ToTokens`，不导入名为 `quote` 的符号。

根项目通过路径依赖引用宏包：

```toml cjtest=project id=examples.macros.macro-package.language.macro-project file=cjpm.toml command=run timeout=90s
[package]
cjc-version = "1.0.5"
name = "macro_project"
version = "0.1.0"
output-type = "executable"

[dependencies]
macro_defs = { path = "./macros" }
```

宏包必须编译为静态库，并通过 `--compile-macro` 标记为宏模块：

```toml cjtest=file project=examples.macros.macro-package.language.macro-project file=macros/cjpm.toml
[package]
cjc-version = "1.0.5"
name = "macro_defs"
version = "0.1.0"
output-type = "static"
compile-option = "--compile-macro"
```

宏实现接收调用处的 `Tokens`，再通过 `quote` 返回展开后的表达式：

```cangjie cjtest=file project=examples.macros.macro-package.language.macro-project file=macros/src/twice.cj
macro package macro_defs

import std.ast.ToTokens
import std.ast.Tokens

public macro Twice(input: Tokens): Tokens {
    return quote(($(input)) * 2)
}
```

应用导入宏包并以 `@Twice` 调用声明宏：

```cangjie cjtest=file project=examples.macros.macro-package.language.macro-project file=src/main.cj
package macro_project

import macro_defs.*

func verify(actual: Int64): Unit {
    if (actual != 42) {
        throw Exception("expected 42, got ${actual}")
    }
}

main(): Unit {
    let actual = @Twice(21)
    verify(actual)
    println("macro=${actual}")
}
```

预期标准输出：

```text cjtest=expect for=examples.macros.macro-package.language.macro-project stream=stdout match=exact
macro=42
```
