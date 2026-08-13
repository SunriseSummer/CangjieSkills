<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.littleendianorder.readlittleendian.readlittleendian-9b372222c0" parent="std.binary.interface.littleendianorder.readlittleendian" -->
# LittleEndianOrder<T>.static func readLittleEndian(Array<UInt8>)

[← LittleEndianOrder<T>.readLittleEndian](index.md)

## 签名

```cangjie role=signature
public static func readLittleEndian(buffer: Array<UInt8>): Float16
```

从字节数组中以小端序的方式读取一个 Float16 值。

适用扩展：[extend Float16 <: LittleEndianOrder<Float16>](../extensions/extend-float16-littleendianorder-float16.md)。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待读取的数据。

返回值：

- Float16 - Float16 值。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 Float16 值时，抛出异常。
