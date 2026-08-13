<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv4address.readbigendian" parent="std.net.class.ipv4address" -->
# IPv4Address.readBigEndian

[← IPv4Address](index.md)

## 签名

```cangjie role=signature
public static func readBigEndian(buffer: Array<Byte>): IPv4Address
```

从字节数组中以大端序的方式读取一个 IPv4Address 对象。

## 契约

参数：

- buffer: Array\<Byte> - 缓冲区，用于存放待读取的数据。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 IPv4Address 值时，抛出异常。

返回值：

- IPv4Address - IPv4Address 对象。
