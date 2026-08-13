<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixsocket.isclosed" parent="std.net.class.unixsocket" -->
# UnixSocket.isClosed

[← UnixSocket](index.md)

## 签名

```cangjie role=signature
public func isClosed(): Bool
```

判断套接字是否通过调用 `close` 显式关闭。

## 契约

返回值：

- Bool - 返回套接字是否已经调用 `close` 显示关闭。是则返回 `true`；否则，返回 `false`。
