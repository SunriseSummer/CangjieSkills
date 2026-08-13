<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv6address.readbigendian" parent="std.net.class.ipv6address" -->
# IPv6Address.readBigEndian

[← IPv6Address](index.md)

## 签名

```cangjie role=signature
public static func readBigEndian(buffer: Array<Byte>): IPv6Address
```

从字节数组中以大端序的方式读取一个 IPv6Address 对象。

## 契约

参数：

- buffer: Array\<Byte> - 缓冲区，用于存放待读取的数据。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 IPv6Address 值时，抛出异常。

返回值：

- IPv6Address - IPv6Address 对象。
