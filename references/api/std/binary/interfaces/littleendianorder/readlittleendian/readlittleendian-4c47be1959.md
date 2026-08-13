<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.littleendianorder.readlittleendian.readlittleendian-4c47be1959" parent="std.binary.interface.littleendianorder.readlittleendian" -->
# LittleEndianOrder<T>.static func readLittleEndian(Array<UInt8>)

[← LittleEndianOrder<T>.readLittleEndian](index.md)

## 签名

```cangjie role=signature
public static func readLittleEndian(buffer: Array<UInt8>): UInt32
```

从字节数组中以小端序的方式读取一个 UInt32 值。

适用扩展：[extend UInt32 <: LittleEndianOrder<UInt32>](../extensions/extend-uint32-littleendianorder-uint32.md)。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待读取的数据。

返回值：

- UInt32 - UInt32 值。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 UInt32 值时，抛出异常。
