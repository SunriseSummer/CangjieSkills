<!-- cj-doc kind="example-category" level="3" id="examples.code-quality" parent="examples" -->
# 代码格式化与静态检查

[← 应用示例](../index.md)

把 cjfmt 与 cjlint 组成可审计的质量门禁，并核对诊断、输入覆盖和报告产物。

| 示例 | 教学目标 |
|---|---|
| [建立 cjfmt 与 cjlint 质量门禁](format-lint-gate.md) | 先构建，再把 cjfmt 输出写入独立目录并与源码比较，最后运行 cjlint；不能只依赖工具退出码。 |
