<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.littleendianorder.readlittleendian.readlittleendian-162376a9c3" parent="std.binary.interface.littleendianorder.readlittleendian" -->
# LittleEndianOrder<T>.static func readLittleEndian(Array<UInt8>)

[← LittleEndianOrder<T>.readLittleEndian](index.md)

## 签名

```cangjie role=signature
public static func readLittleEndian(buffer: Array<UInt8>): Int64
```

从字节数组中以小端序的方式读取一个 Int64 值。

适用扩展：[extend Int64 <: LittleEndianOrder<Int64>](../extensions/extend-int64-littleendianorder-int64.md)。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待读取的数据。

返回值：

- Int64 - Int64 值。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 Int64 值时，抛出异常。
