<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.bigendianorder.readbigendian.readbigendian-d1b8eb38b7" parent="std.binary.interface.bigendianorder.readbigendian" -->
# BigEndianOrder<T>.static func readBigEndian(Array<UInt8>)

[← BigEndianOrder<T>.readBigEndian](index.md)

## 签名

```cangjie role=signature
public static func readBigEndian(buffer: Array<UInt8>): Float64
```

从字节数组中以大端序的方式读取一个 Float64 值。

适用扩展：[extend Float64 <: BigEndianOrder<Float64>](../extensions/extend-float64-bigendianorder-float64.md)。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待读取的数据。

返回值：

- Float64 - Float64 值。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 Float64 值时，抛出异常。
