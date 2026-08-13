<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.littleendianorder.readlittleendian.readlittleendian-08f22590d6" parent="std.binary.interface.littleendianorder.readlittleendian" -->
# LittleEndianOrder<T>.static func readLittleEndian(Array<UInt8>)

[← LittleEndianOrder<T>.readLittleEndian](index.md)

## 签名

```cangjie role=signature
public static func readLittleEndian(buffer: Array<UInt8>): UInt8
```

从字节数组中以小端序的方式读取一个 UInt8 值。

适用扩展：[extend UInt8 <: LittleEndianOrder<UInt8>](../extensions/extend-uint8-littleendianorder-uint8.md)。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待读取的数据。

返回值：

- UInt8 - UInt8 值。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 UInt8 值时，抛出异常。
