<!-- cj-doc kind="example-leaf" level="4" id="examples.cli-process.cli-exit-status" parent="examples.cli-process" -->
# 报告并验证命令行退出状态

[← 命令行与子进程](index.md)

`main(args): Int64` 用非零值报告失败；测试退出码时直接运行构建产物，因为 Windows 上 cjpm 1.0.5 不透传该状态。

## 核心指导

需要向调用脚本报告失败时，让 `main(args)` 返回 `Int64`：`0` 表示成功，非零值区分用法错误或业务错误；诊断写入 stderr。Windows x64 cjnative 1.0.5 实测中，`cjpm run` 自身仍返回 0，不会透传程序的非零状态，因此自动测试必须构建后直接启动生成的可执行文件。

下面的 `launcher=direct` 是本 Skill 测试框架的受控标记：先执行 `cjpm build`，再以参数数组直接启动 `target/release/bin/main[.exe]`，从而同时断言 stderr 和真实进程退出码。

```toml cjtest=project id=app.cli-exit-status file=cjpm.toml command=run launcher=direct exit=2 timeout=60s
[package]
cjc-version = "1.0.5"
name = "cli_exit_status"
version = "0.1.0"
output-type = "executable"
```

仓颉源码 `src/main.cj`：

```cangjie cjtest=file project=app.cli-exit-status file=src/main.cj
package cli_exit_status

main(args: Array<String>): Int64 {
    if (args.size != 1) {
        eprintln("usage: cli_exit_status <input>")
        return 2
    }
    println("input=${args[0]}")
    return 0
}
```

预期标准错误：

```text cjtest=expect for=app.cli-exit-status stream=stderr match=exact
usage: cli_exit_status <input>
```
