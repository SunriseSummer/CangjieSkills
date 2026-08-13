<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixdatagramsocket.prop-sendbuffersize" parent="std.net.class.unixdatagramsocket" -->
# UnixDatagramSocket.sendBufferSize

[← UnixDatagramSocket](index.md)

## 签名

```cangjie role=signature
public mut prop sendBufferSize: Int64
```

设置和读取 `SO_SNDBUF` 属性，提供一种方式指定发包缓存大小。

## 契约

功能：设置和读取 `SO_SNDBUF` 属性，提供一种方式指定发包缓存大小。选项的生效情况取决于系统。

类型：Int64

异常：

- IllegalArgumentException - 当 `size` 小于等于 0 时，抛出异常。
- SocketException - 当 `Socket` 已关闭时，抛出异常。
