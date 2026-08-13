<!-- cj-doc kind="example-leaf" level="4" id="examples.binary.bytebuffer" parent="examples.binary" -->
# 用 ByteBuffer 组装字节数据

[← 字节缓冲与端序](index.md)

写入数据、调整读取位置并取得剩余字节，避免向空目标数组读取。

## 典型示例

`ByteBuffer` 既可累积写入，也可通过 `bytes()` 取得当前有效数据；按 UTF-8 解码即可还原文本。

```cangjie cjtest=run id=examples.binary.bytebuffer.api.bytebuffer.write.run form=unit timeout=20s
package bytebuffer_write_example

import std.io.*

main(): Unit {
    let buffer = ByteBuffer()
    buffer.write("Hello ".toArray())
    buffer.write("Cangjie".toArray())
    println(String.fromUtf8(buffer.bytes()))
}
```

预期标准输出：

```text cjtest=expect for=examples.binary.bytebuffer.api.bytebuffer.write.run stream=stdout match=exact
Hello Cangjie
```
