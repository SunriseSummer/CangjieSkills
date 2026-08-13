<!-- cj-doc kind="example-leaf" level="4" id="examples.binary.big-endian" parent="examples.binary" -->
# 按大端序读取 Int64

[← 字节缓冲与端序](index.md)

从至少八字节的缓冲区恢复整数，并遵守 1.0.5 的实际异常契约。

## 典型示例

`Int64.readBigEndian` 将数组开头的 8 个字节按高位在前还原为整数；仓颉 1.0.5 实测缓冲区不足 8 字节时抛出 `IndexOutOfBoundsException`。

```cangjie cjtest=run id=examples.binary.big-endian.api.int64.read-big-endian.run form=unit timeout=20s
package int64_read_big_endian_example

import std.binary.*

main(): Unit {
    println(Int64.readBigEndian([0, 0, 0, 0, 0, 0, 1, 2]))

    try {
        Int64.readBigEndian([0, 1])
    } catch (_: IndexOutOfBoundsException) {
        println("buffer too small")
    }
}
```

预期标准输出：

```text cjtest=expect for=examples.binary.big-endian.api.int64.read-big-endian.run stream=stdout match=exact
258
buffer too small
```
