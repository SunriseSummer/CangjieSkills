<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.3-常用命令选项表.3-2-run-选项" parent="tools.cjpm.3-常用命令选项表" -->
# 3.2 run 选项

[← 3. 常用命令选项表](index.md)

`cjpm run --run-args="..."` 转发参数，但 1.0.5 会把单个实参中的 `=` 拆成两个实参；OptionalValue 的 `--opt=value` 应改用短附着形式或直接运行构建产物。Windows 上 cjpm 还不透传程序非零状态。

| 选项 | 说明 |
|------|------|
| `--name <value>` | 指定运行的二进制名（默认 `main`） |
| `--build-args <value>` | 传递给 build 的参数 |
| `--run-args <value>` | 传递给可执行文件的参数 |
| `--skip-build` | 跳过编译，直接运行 |
| `-g` | 运行调试版本 |
| `--skip-script` | 跳过构建脚本 |

```bash
# 传递编译与运行参数
cjpm run --build-args="-s -j16" --run-args="a b c"
```

仓颉 1.0.5 必须通过 `--run-args` 透传程序参数，不能写成 `cjpm run -- a b c`。Windows x64 cjnative 1.0.5 实测中，若 `main(): Int64` 返回非零状态，`cjpm run` 仍以 0 退出；需要断言程序退出码时，先构建并直接启动 `target/release/bin/main.exe`（其他平台为 `main`）。

1.0.5 的 `run-args` 还会把单个实参中的 `=` 拆成两个实参，例如 `--mode=fast` 到程序中成为 `--mode`、`fast`。这对 argopt 的 `RequiredValue` 通常仍可用，但会破坏 `OptionalValue` 只接受附着值的语义。此类选项优先用短附着形式（如 `-mfast`），或直接运行构建产物以保留精确实参边界。
