<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.prop-localaddress" parent="std.net.class.rawsocket" -->
# RawSocket.localAddress

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public prop localAddress: RawAddress
```

获取当前 RawSocket 实例的本地地址。

## 契约

类型：RawAddress

异常：

- SocketException - 当前 RawSocket 实例已经关闭，或无法获取本地地址时，抛出异常。
