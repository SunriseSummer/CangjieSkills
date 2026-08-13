<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixserversocket.close" parent="std.net.class.unixserversocket" -->
# UnixServerSocket.close

[← UnixServerSocket](index.md)

## 签名

```cangjie role=signature
public override func close(): Unit
```

关闭套接字，该套接字的所有操作除了 `close/isClosed` 之外，均不允许再调用。

## 契约

功能：关闭套接字，该套接字的所有操作除了 `close/isClosed` 之外，均不允许再调用。此接口允许多次调用。
