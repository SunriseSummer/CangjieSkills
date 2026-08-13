<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixdatagramsocket.close" parent="std.net.class.unixdatagramsocket" -->
# UnixDatagramSocket.close

[← UnixDatagramSocket](index.md)

## 签名

```cangjie role=signature
public override func close(): Unit
```

关闭套接字，所有操作除了 `close/isClosed` 之外，均不允许再调用。

## 契约

功能：关闭套接字，所有操作除了 `close/isClosed` 之外，均不允许再调用。接口允许多次调用。
