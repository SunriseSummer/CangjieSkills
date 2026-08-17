<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.3-常用命令选项表.3-2-run-选项" parent="tools.cjpm.3-常用命令选项表" -->
# 3.2 run 选项

[← 3. 常用命令选项表](index.md)

1.1.3 优先用 `cjpm run -- <args...>` 原样转发参数；旧的 `--run-args` 已提示未来移除，并仍会把单个实参中的 `=` 拆开。Windows 上 cjpm 仍不透传程序非零状态。

| 选项 | 说明 |
|------|------|
| `--name <value>` | 指定运行的二进制名（默认 `main`） |
| `--build-args <value>` | 传递给 build 的参数 |
| `--run-args <value>` | 传递给可执行文件的参数 |
| `-- <args...>` | 1.1.3 推荐的参数边界；保留每个实参及其中的 `=` |
| `--skip-build` | 跳过编译，直接运行 |
| `-g` | 运行调试版本 |
| `--skip-script` | 跳过构建脚本 |

```bash
# 传递编译与运行参数
cjpm run --build-args="-s -j16" -- a b c --mode=fast
```

Windows x64 cjnative 1.1.3 实测中，`cjpm run -- a --mode=fast` 会向程序传递两个完整实参，但若 `main(): Int64` 返回非零状态，`cjpm run` 仍以 0 退出。需要断言程序退出码时，先构建并直接启动 `target/release/bin/main.exe`（其他平台为 `main`）。兼容旧脚本时可以暂用 `--run-args`，但 `--mode=fast` 仍会被拆成 `--mode`、`fast`。
