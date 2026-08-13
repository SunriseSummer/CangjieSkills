<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.6-高级配置.6-1-profile-配置" parent="tools.cjpm.6-高级配置" -->
# 6.1 Profile 配置

[← 6. 高级配置](index.md)

```toml
[profile.build]
  lto = "full"                         # "thin" 或 "full"（仅 Linux）

[profile.test]

[profile.test.build]
  compile-option = "-g"
  mock = "on"                          # "on"（默认）/ "off" / "runtime-error"

[profile.test.env]
  MY_ENV = { value = "abc" }
  cjHeapSize = { value = "32GB", splice-type = "replace" }
  PATH = { value = "/usr/local/bin", splice-type = "prepend" }

[profile.bench]
  no-color = true
  report-format = "csv"                # "csv" 或 "csv-raw"
  baseline-path = "bench_baseline"     # 对比基线报告路径
```

**自定义透传选项：**

```toml
[profile.customized-option]
cfg = "--cfg=\"feature1=lion\""
optimize = "-O2"
```

每个键都会成为一个不带值的 cjpm 开关。`cjpm build --cfg --optimize` 会把两个值依次透传给 `cjc`；不要写成 `cjpm build --cfg <value>`。

**环境变量 splice-type：**

| 类型 | 说明 |
|------|------|
| `absent` | 仅在变量不存在时生效（默认） |
| `replace` | 替换已有变量值 |
| `prepend` | 插入到已有值之前 |
| `append` | 追加到已有值之后 |
