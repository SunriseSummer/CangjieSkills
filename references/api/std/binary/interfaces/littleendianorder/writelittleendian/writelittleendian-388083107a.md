<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.littleendianorder.writelittleendian.writelittleendian-388083107a" parent="std.binary.interface.littleendianorder.writelittleendian" -->
# LittleEndianOrder<T>.func writeLittleEndian(Array<UInt8>)

[← LittleEndianOrder<T>.writeLittleEndian](index.md)

## 签名

```cangjie role=signature
public func writeLittleEndian(buffer: Array<UInt8>): Int64
```

将 Int16 值以小端序的方式写入字节数组中。

适用扩展：[extend Int16 <: LittleEndianOrder<Int16>](../extensions/extend-int16-littleendianorder-int16.md)。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待写入的数据。

返回值：

- Int64 - 写入的数据的字节数。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以存储 Int16 值时，抛出异常。
