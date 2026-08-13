<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv6address.writebigendian" parent="std.net.class.ipv6address" -->
# IPv6Address.writeBigEndian

[← IPv6Address](index.md)

## 签名

```cangjie role=signature
public func writeBigEndian(buffer: Array<Byte>): Int64
```

返回此 IPv6Address 对象以大端序的方式写入字节数组中。

## 契约

参数：

- buffer: Array\<Byte> - 缓冲区，用于存放待写入的数据。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以写入 IPv6Address 值时，抛出异常。

返回值：

- Int64 - 写入的数据的字节数。
