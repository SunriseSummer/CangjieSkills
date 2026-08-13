<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.bigendianorder.writebigendian.writebigendian-f011b0bfda" parent="std.binary.interface.bigendianorder.writebigendian" -->
# BigEndianOrder<T>.func writeBigEndian(Array<UInt8>)

[← BigEndianOrder<T>.writeBigEndian](index.md)

## 签名

```cangjie role=signature
func writeBigEndian(buffer: Array<UInt8>): Int64
```

将 T 值以大端序的方式写入字节数组中。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待写入的数据。

返回值：

- Int64 - 写入的数据的字节数。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以存储 T 值时，抛出异常。
