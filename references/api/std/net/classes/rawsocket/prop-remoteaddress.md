<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.prop-remoteaddress" parent="std.net.class.rawsocket" -->
# RawSocket.remoteAddress

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public prop remoteAddress: RawAddress
```

获取当前 RawSocket 实例的对端地址。

## 契约

类型：RawAddress

异常：

- SocketException - 当前 RawSocket 实例已经关闭，或无法获取对端地址时，抛出异常。
