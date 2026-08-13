<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.6-高级配置.6-4-构建脚本-build-cj" parent="tools.cjpm.6-高级配置" -->
# 6.4 构建脚本（build.cj）

[← 6. 高级配置](index.md)

构建脚本必须固定命名为 `build.cj`，并与 `cjpm.toml` 同级；`cjpm init` 不会自动创建它。入口签名必须是 `main(): Int64`，阶段名从 `Process.current.arguments[0]` 读取。

```cangjie cjtest=skip id=tools-cjpm-build-script-main reason="verified-by-build-script-project-fixture"
import std.process.*

func stagePreBuild(): Int64 {
    println("PRE-BUILD")
    return 0
}

func stagePostBuild(): Int64 {
    println("POST-BUILD")
    return 0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-build" => stagePreBuild()
        case "post-build" => stagePostBuild()
        case _ => 0
    }
}
```

| cjpm 命令 | 当前模块 | 依赖模块 |
|---|---|---|
| `build`、`test`、`bench` | `pre-*`、`post-*` | 对应 `pre-*`、`post-*` |
| `run`、`install` | 对应 `pre-*`、`post-*` | 构建阶段的 `pre-build`、`post-build` |
| `check`、`tree`、`update` | 对应 `pre-*`、`post-*` | 不执行 |
| `clean` | 仅 `pre-clean` | 不执行 |

- 阶段函数返回 `0` 表示成功；返回非零，或 `build.cj` 编译失败，都会中止 cjpm 命令。
- 脚本输出写入 `build-script-cache/<profile>/<module>/bin/script-log`；默认构建 profile 为 `release`。
- `[script-dependencies]` 只供构建脚本使用，与源码/测试依赖相互独立。
- `--skip-script` 跳过当前模块和依赖模块的所有构建脚本。
