<!-- cj-doc kind="example-leaf" level="4" id="examples.project-build.cjpm-minimal" parent="examples.project-build" -->
# 创建最小可执行工程

[← 项目构建与测试](index.md)

用 1.1.3 清单、包声明和 main 建立可直接执行的 cjpm 工程骨架。

## 可直接重建的完整项目

根工程入口文件 `cjpm.toml`：

```toml cjtest=project id=examples.project-build.cjpm-minimal.tools.cjpm.project-minimal file=cjpm.toml command=run timeout=60s
[package]
cjc-version = "1.1.3"
name = "cjdoc_project"
version = "0.1.0"
output-type = "executable"
```

仓颉源码 `src/main.cj`：

```cangjie cjtest=file project=examples.project-build.cjpm-minimal.tools.cjpm.project-minimal file=src/main.cj
package cjdoc_project

main(): Unit {
    println("project-ok")
}
```

预期标准输出：

```text cjtest=expect for=examples.project-build.cjpm-minimal.tools.cjpm.project-minimal stream=stdout match=exact
project-ok
```
