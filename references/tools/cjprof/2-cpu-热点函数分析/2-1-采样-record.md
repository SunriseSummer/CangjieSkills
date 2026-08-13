<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjprof.2-cpu-热点函数分析.2-1-采样-record" parent="tools.cjprof.2-cpu-热点函数分析" -->
# 2.1 采样（record）

[← 2. CPU 热点函数分析](index.md)

```bash
# 采样正在运行的进程
cjprof record -f 10000 -p 12345 -o sample.data

# 启动新程序并采样
cjprof record -f max -- ./test arg1 arg2
```

| 选项 | 说明 |
|------|------|
| `-f` / `--freq <freq>` | 采样频率（Hz），默认 5000，`max` 取系统最大值 |
| `-o` / `--output <file>` | 输出文件名（默认 `cjprof.data`） |
| `-p` / `--pid <pid>` | 指定进程 ID |

> 采样只在被采样程序退出后结束。如需提前结束，可按 `Ctrl+C` 停止采样。
