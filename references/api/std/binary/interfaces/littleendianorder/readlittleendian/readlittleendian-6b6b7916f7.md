<!-- cj-doc kind="api-member" level="7" id="std.binary.interface.littleendianorder.readlittleendian.readlittleendian-6b6b7916f7" parent="std.binary.interface.littleendianorder.readlittleendian" -->
# LittleEndianOrder<T>.static func readLittleEndian(Array<UInt8>)

[← LittleEndianOrder<T>.readLittleEndian](index.md)

## 签名

```cangjie role=signature
static func readLittleEndian(buffer: Array<UInt8>): T
```

从字节数组中以小端序的方式读取一个 T 值。

## 契约

参数：

- buffer: Array\<UInt8> - 缓冲区，用于存放待读取的数据。

返回值：

- T - T 值。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 T 值时，抛出异常。
