<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.listen" parent="std.net.class.rawsocket" -->
# RawSocket.listen

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public func listen(backlog: Int32): Unit
```

监听当前 RawSocket 实例绑定的地址。

## 契约

参数：

- backlog: Int32 - 等待队列增长的最大长度。

异常：

- SocketException - 当前 RawSocket 实例已经关闭，或监听失败时，抛出异常。
