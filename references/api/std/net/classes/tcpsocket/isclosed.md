<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.isclosed" parent="std.net.class.tcpsocket" -->
# TcpSocket.isClosed

[← TcpSocket](index.md)

## 签名

```cangjie role=signature
public func isClosed(): Bool
```

判断套接字是否通过调用 `close` 显式关闭。

## 契约

返回值：

- Bool - 套接字是否已经调用 `close` 显式关闭。是则返回 `true`；否则返回 `false`。
