<!-- cj-doc kind="example-leaf" level="4" id="examples.text.int64-parse" parent="examples.text" -->
# 解析带进制的整数

[← 字符串、正则与文本解析](index.md)

调用 Parsable.parse，并对非法文本处理异常，而不是依赖隐式转换。

## 典型示例

`parse` 适合输入必须合法、失败应立即中止当前操作的场景；它接受负号，但首字符为 `+` 或内容越界时会抛出 `IllegalArgumentException`。需要把失败保留为值时，改用 `tryParse`。

```cangjie cjtest=run id=examples.text.int64-parse.api.int64.parse.run form=unit timeout=20s
package int64_parse_example

import std.convert.*

main(): Unit {
    println(Int64.parse("-42"))

    try {
        Int64.parse("+42")
    } catch (_: IllegalArgumentException) {
        println("invalid integer")
    }
}
```

预期标准输出：

```text cjtest=expect for=examples.text.int64-parse.api.int64.parse.run stream=stdout match=exact
-42
invalid integer
```
