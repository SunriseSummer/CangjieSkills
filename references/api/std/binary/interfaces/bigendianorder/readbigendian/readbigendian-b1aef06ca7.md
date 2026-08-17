<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.bigendianorder.readbigendian.readbigendian-b1aef06ca7" parent="std.binary.interface.bigendianorder.readbigendian" -->
# BigEndianOrder<T>.static func readBigEndian(Array<UInt8>)

[← BigEndianOrder<T>.readBigEndian](index.md)

## 签名

```cangjie role=signature
public static func readBigEndian(buffer: Array<UInt8>): Int64
```

从字节数组中以大端序的方式读取一个 Int64 值。

适用扩展：[extend Int64 <: BigEndianOrder<Int64>](../extensions/extend-int64-bigendianorder-int64.md)。

## 契约

参数：

- buffer: Array<UInt8> - 至少包含 8 个字节的输入缓冲区；从索引 0 开始读取。

返回值：

- Int64 - 按大端序还原的整数。

异常：

- IndexOutOfBoundsException - 仓颉 1.1.3 实测在 buffer 少于 8 字节时抛出。发布件原始 API 将此处记为 IllegalArgumentException，与运行时行为不一致。

## 典型示例

`Int64.readBigEndian` 将数组开头的 8 个字节按高位在前还原为整数；仓颉 1.1.3 实测缓冲区不足 8 字节时抛出 `IndexOutOfBoundsException`。

```cangjie cjtest=run id=api.int64.read-big-endian.run form=unit timeout=20s
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

```text cjtest=expect for=api.int64.read-big-endian.run stream=stdout match=exact
258
buffer too small
```
