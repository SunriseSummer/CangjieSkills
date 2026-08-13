<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipaddress.readbigendian" parent="std.net.class.ipaddress" -->
# IPAddress.readBigEndian

[← IPAddress](index.md)

## 签名

```cangjie role=signature
public static func readBigEndian(buffer: Array<Byte>): IPAddress
```

从字节数组中以大端序的方式读取一个 IPAddress 对象。

## 契约

参数：

- buffer: Array\<Byte> - 缓冲区，用于存放待读取的数据。

异常：

- IllegalArgumentException - 当 buffer 太小，不足以读出 IPAddress 值时，抛出异常。

返回值：

- IPAddress - IPAddress 对象。
