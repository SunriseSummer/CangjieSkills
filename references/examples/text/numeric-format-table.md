<!-- cj-doc kind="example-leaf" level="4" id="examples.text.numeric-format-table" parent="examples.text" -->
# 格式化定宽数值表格

[← 字符串、正则与文本解析](index.md)

组合 width、precision 和对齐标志，生成列宽稳定的整数与浮点文本。

## 典型示例

先分别格式化字段，再拼接行。整数的宽度默认右对齐，前置 `-` 改为左对齐；浮点格式串可同时给出总宽度和小数位数。格式化能力来自 `std.convert` 扩展，必须导入。

```cangjie cjtest=run id=std.numeric-format-table.run form=unit timeout=20s
package numeric_format_table_example

import std.convert.*

main(): Unit {
    let name = "items"
    let count = 20.format("6")
    let price = 12.3456.format("8.2")
    println("${name}|${count}|${price}")
}
```

预期标准输出：

```text cjtest=expect for=std.numeric-format-table.run stream=stdout match=exact
items|    20|   12.35
```
