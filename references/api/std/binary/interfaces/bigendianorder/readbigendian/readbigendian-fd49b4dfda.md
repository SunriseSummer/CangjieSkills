<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.bigendianorder.readbigendian.readbigendian-fd49b4dfda" parent="std.binary.interface.bigendianorder.readbigendian" -->
# BigEndianOrder<T>.static func readBigEndian(Array<UInt8>)

[← BigEndianOrder<T>.readBigEndian](index.md)

## 签名

```cangjie role=signature
public static func readBigEndian(buffer: Array<UInt8>): UInt16
```

从字节数组中以大端序的方式读取一个 UInt16 值。

适用扩展：[extend UInt16 <: BigEndianOrder<UInt16>](../extensions/extend-uint16-bigendianorder-uint16.md)。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待读取的数据。

返回值：

- UInt16 - UInt16 值。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 UInt16 值时，抛出异常。
