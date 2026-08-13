<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.bigendianorder.writebigendian.writebigendian-87d3a2fb89" parent="std.binary.interface.bigendianorder.writebigendian" -->
# BigEndianOrder<T>.func writeBigEndian(Array<UInt8>)

[← BigEndianOrder<T>.writeBigEndian](index.md)

## 签名

```cangjie role=signature
public func writeBigEndian(buffer: Array<UInt8>): Int64
```

将 Int16 值以大端序的方式写入字节数组中。

适用扩展：[extend Int16 <: BigEndianOrder<Int16>](../extensions/extend-int16-bigendianorder-int16.md)。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待写入的数据。

返回值：

- Int64 - 写入的数据的字节数。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以存储 Int16 值时，抛出异常。
