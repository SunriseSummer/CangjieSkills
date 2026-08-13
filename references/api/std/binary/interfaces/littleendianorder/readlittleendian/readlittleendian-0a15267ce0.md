<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.littleendianorder.readlittleendian.readlittleendian-0a15267ce0" parent="std.binary.interface.littleendianorder.readlittleendian" -->
# LittleEndianOrder<T>.static func readLittleEndian(Array<UInt8>)

[← LittleEndianOrder<T>.readLittleEndian](index.md)

## 签名

```cangjie role=signature
public static func readLittleEndian(buffer: Array<UInt8>): Int16
```

从字节数组中以小端序的方式读取一个 Int16 值。

适用扩展：[extend Int16 <: LittleEndianOrder<Int16>](../extensions/extend-int16-littleendianorder-int16.md)。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待读取的数据。

返回值：

- Int16 - Int16 值。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 Int16 值时，抛出异常。
