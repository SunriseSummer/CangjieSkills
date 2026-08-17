<!-- cj-doc kind="example-leaf" level="4" id="examples.compression.zlib-roundtrip" parent="examples.compression" -->
# Deflate 压缩与解压往返

[← 数据压缩](index.md)

明确选择 DeflateFormat，并关闭输出流以完成尾部写入。

## 典型示例

`CompressOutputStream` 绑定任意 `OutputStream`；写完后必须调用 `close()`，压缩尾部信息才完整。压缩端和解压端必须使用相同的包装格式，本例演示无 Gzip 头的 `DeflateFormat`。解压端持续读取到 EOF，并同样关闭流以释放原生压缩资源。

仓颉/stdx 1.1.3.1 中 `DeflateFormat` 不能从 `stdx.compress.zlib` 单独精确导入，因此这里保留包通配导入；这是版本可访问性限制，不是推荐普遍使用通配导入。

```cangjie cjtest=run id=examples.compression.zlib-roundtrip.api.stdx.zlib.roundtrip.run form=unit requires=stdx timeout=60s
package stdx_zlib_roundtrip_example

import std.io.*
import std.collection.ArrayList
import stdx.compress.zlib.*

main(): Unit {
    let source = Array<Byte>(1024, repeat: b'A')
    let compressed = ByteBuffer()
    let encoder = CompressOutputStream(compressed, wrap: DeflateFormat)
    encoder.write(source)
    encoder.close()

    let compressedBytes = compressed.bytes()
    let decoder = DecompressInputStream(ByteBuffer(compressedBytes), wrap: DeflateFormat)
    let chunks = ArrayList<Byte>()
    let buffer = Array<Byte>(128, repeat: 0)
    var size = decoder.read(buffer)
    while (size > 0) {
        chunks.add(all: buffer[..size])
        size = decoder.read(buffer)
    }
    decoder.close()
    let restored = chunks.toArray()

    println(compressedBytes.size < source.size)
    println(restored == source)
}
```

预期标准输出：

```text cjtest=expect for=examples.compression.zlib-roundtrip.api.stdx.zlib.roundtrip.run stream=stdout match=exact
true
true
```
