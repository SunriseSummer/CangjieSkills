<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixserversocket.prop-receivebuffersize" parent="std.net.class.unixserversocket" -->
# UnixServerSocket.receiveBufferSize

[← UnixServerSocket](index.md)

## 签名

```cangjie role=signature
public mut prop receiveBufferSize: Int64
```

设置和读取 `SO_RCVBUF` 属性。

## 契约

类型：Int64

异常：

- IllegalArgumentException - 当 `size` 小于等于 0 时，抛出异常。
- SocketException - 当 `Socket` 已关闭时，抛出异常。
