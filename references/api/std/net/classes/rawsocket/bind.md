<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.bind" parent="std.net.class.rawsocket" -->
# RawSocket.bind

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public func bind(addr: RawAddress): Unit
```

将当前 RawSocket 实例与指定的套接字地址进行绑定。

## 契约

参数：

- addr: RawAddress - 套接字地址。

异常：

- SocketException - 当前 RawSocket 实例已经关闭，或绑定失败时，抛出异常。
