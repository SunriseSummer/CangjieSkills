<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.compressoutputstream.write" parent="stdx.compress.zlib.class.compressoutputstream" -->
# CompressOutputStream.write

[← CompressOutputStream](index.md)

## 签名

```cangjie role=signature
public func write(inBuf: Array<Byte>): Unit
```

将指定字节数组中的数据进行压缩，并写入输出流，当数据全部压缩完成并写入输出流，函数返回。

## 契约

参数：

- inBuf: Array\<Byte> - 待压缩的字节数组。

异常：

- ZlibException - 如果当前压缩输出流已经被关闭，或压缩数据失败，抛出异常。

## 典型示例

`CompressOutputStream` 绑定任意 `OutputStream`；写完后必须调用 `close()`，压缩尾部信息才完整。压缩端和解压端必须使用相同的包装格式，本例演示无 Gzip 头的 `DeflateFormat`。解压端持续读取到 EOF，并同样关闭流以释放原生压缩资源。

仓颉/stdx 1.0.5.1 中 `DeflateFormat` 不能从 `stdx.compress.zlib` 单独精确导入，因此这里保留包通配导入；这是版本可访问性限制，不是推荐普遍使用通配导入。

```cangjie cjtest=run id=api.stdx.zlib.roundtrip.run form=unit requires=stdx timeout=60s
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

```text cjtest=expect for=api.stdx.zlib.roundtrip.run stream=stdout match=exact
true
true
```
