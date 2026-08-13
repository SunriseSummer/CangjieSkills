<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixdatagramsocket.bind" parent="std.net.class.unixdatagramsocket" -->
# UnixDatagramSocket.bind

[← UnixDatagramSocket](index.md)

## 签名

```cangjie role=signature
public func bind(): Unit
```

绑定一个 `Unix datagram` 套接字，并创建监听队列。

## 契约

此接口自动在本地地址中创建一个套接字文件，如该文件已存在则会绑定失败。此文件类型可通过 isSock() 判断是否存在，可通过 unlink() 接口删除，失败后需要 `close` 套接字，不支持多次重试。

异常：

- SocketException - 当文件地址已存在，或文件创建失败时，抛出异常。
