<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.littleendianorder.writelittleendian.writelittleendian-744e2226c7" parent="std.binary.interface.littleendianorder.writelittleendian" -->
# LittleEndianOrder<T>.func writeLittleEndian(Array<UInt8>)

[← LittleEndianOrder<T>.writeLittleEndian](index.md)

## 签名

```cangjie role=signature
public func writeLittleEndian(buffer: Array<UInt8>): Int64
```

将 Float64 值以小端序的方式写入字节数组中。

适用扩展：[extend Float64 <: LittleEndianOrder<Float64>](../extensions/extend-float64-littleendianorder-float64.md)。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待写入的数据。

返回值：

- Int64 - 写入的数据的字节数。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以存储 Float64 值时，抛出异常。
