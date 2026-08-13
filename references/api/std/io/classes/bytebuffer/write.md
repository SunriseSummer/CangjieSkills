<!-- cj-doc kind="api-member" level="6" id="std.io.class.bytebuffer.write" parent="std.io.class.bytebuffer" -->
# ByteBuffer.write

[← ByteBuffer](index.md)

## 签名

```cangjie role=signature
public func write(buffer: Array<Byte>): Unit
```

将 `buffer` 中的数据写入到输出流中。

## 契约

参数：

- buffer: Array\<Byte> - 待写入数据的缓冲区。

## 典型示例

`ByteBuffer` 既可累积写入，也可通过 `bytes()` 取得当前有效数据；按 UTF-8 解码即可还原文本。

```cangjie cjtest=run id=api.bytebuffer.write.run form=unit timeout=20s
package bytebuffer_write_example

import std.io.*

main(): Unit {
    let buffer = ByteBuffer()
    buffer.write("Hello ".toArray())
    buffer.write("Cangjie".toArray())
    println(String.fromUtf8(buffer.bytes()))
}
```

```text cjtest=expect for=api.bytebuffer.write.run stream=stdout match=exact
Hello Cangjie
```
