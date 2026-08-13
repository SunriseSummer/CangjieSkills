<!-- cj-doc kind="example-leaf" level="4" id="examples.time.datetime-parse" parent="examples.time" -->
# 按格式解析 DateTime

[← 日期与时间](index.md)

让输入与格式模板逐项对应，并捕获 TimeParseException 处理非法日期。

## 典型示例

无格式参数的重载按 RFC 3339 解析；数字月份从 `month.toInteger()` 取得。

```cangjie cjtest=run id=examples.time.datetime-parse.api.datetime.parse.run form=unit timeout=20s
package datetime_parse_example

import std.time.*

main(): Unit {
    let value = DateTime.parse("2024-03-08T14:30:00+08:00")
    println("${value.year}-${value.month.toInteger()}-${value.dayOfMonth}")
    println("${value.hour}:${value.minute}")
}
```

预期标准输出：

```text cjtest=expect for=examples.time.datetime-parse.api.datetime.parse.run stream=stdout match=exact
2024-3-8
14:30
```
