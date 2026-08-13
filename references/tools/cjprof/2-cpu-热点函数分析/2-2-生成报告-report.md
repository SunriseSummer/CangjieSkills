<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjprof.2-cpu-热点函数分析.2-2-生成报告-report" parent="tools.cjprof.2-cpu-热点函数分析" -->
# 2.2 生成报告（report）

[← 2. CPU 热点函数分析](index.md)

```bash
# 文本报告
cjprof report -i sample.data

# 火焰图
cjprof report -F -i sample.data -o flame.svg
```

| 选项 | 说明 |
|------|------|
| `-F` / `--flame-graph` | 生成火焰图（SVG） |
| `-i` / `--input <file>` | 输入数据文件（默认 `cjprof.data`） |
| `-o` / `--output <file>` | 火焰图输出文件（默认 `FlameGraph.svg`） |

**报告说明**：
- 文本报告：显示函数采样总占比（含子函数）、自身占比、函数名，按总占比降序
- 火焰图：横轴=采样占比（越宽越耗时），纵轴=调用栈（父下子上）

---
