<!-- cj-doc kind="example-leaf" level="4" id="examples.code-quality.format-lint-gate" parent="examples.code-quality" -->
# 建立 cjfmt 与 cjlint 质量门禁

[← 代码格式化与静态检查](index.md)

先构建，再把 cjfmt 输出写入独立目录并与源码比较，最后运行 cjlint；不能只依赖工具退出码。

## 核心做法

`cjfmt` 1.1.3 没有 check/dry-run 模式。质量门禁应把格式化结果写到独立目录，再与源码逐文件比较；`cjlint` 则要同时检查诊断文本和报告产物。两种工具都不能只看退出码：还要确认输入文件均被处理，并拒绝 `unknown start of token`、`error`、`Fail` 等诊断。

下面的最小工程由示例框架实际构建并运行，后续质量命令以它为操作对象。

```toml cjtest=project id=tools.format-lint-gate.project file=cjpm.toml command=run timeout=60s
[package]
  cjc-version = "1.1.3"
  name = "quality_gate_example"
  description = "cjfmt and cjlint quality gate fixture"
  version = "1.0.0"
  output-type = "executable"
  src-dir = "src"
  target-dir = ""
  package-configuration = {}
```

工程入口保持为规范格式，便于比较 `cjfmt` 的独立输出。

```cangjie cjtest=file project=tools.format-lint-gate.project file=src/main.cj
package quality_gate_example

main(): Unit {
    println("ready")
}
```

预期标准输出：

```text cjtest=expect for=tools.format-lint-gate.project stream=stdout match=contains
ready
```

从工程根目录依次执行构建、非覆盖格式化和静态检查：

```powershell
cjpm build
cjfmt -d src -o target/cjfmt
git diff --no-index --exit-code -- src target/cjfmt/src
cjlint -f src -o target/cjlint.json -r json
```

门禁还应执行以下断言：

- `src` 与 `target/cjfmt/src` 的 `.cj` 相对路径集合完全相同，输出文件均非空；差异表示源码尚未格式化。
- 捕获并检查 `cjfmt`、`cjlint` 的 stdout/stderr；即使退出码为 0，只要出现跳过文件或错误诊断也应失败。
- `target/cjlint.json` 必须存在、可解析且确由本次运行生成；按团队策略判断其中告警是否允许。
- Windows 1.1.3 下尤其要排除 UTF-8 BOM：它可能触发 `unknown start of token`、跳过文件而仍返回成功。

若仓库不使用 Git，可由 CI 脚本逐文件比较内容；不要为了检查格式直接覆盖工作区源码。
