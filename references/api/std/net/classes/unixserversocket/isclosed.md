<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixserversocket.isclosed" parent="std.net.class.unixserversocket" -->
# UnixServerSocket.isClosed

[← UnixServerSocket](index.md)

## 签名

```cangjie role=signature
public override func isClosed(): Bool
```

判断套接字是否通过调用 `close` 显式关闭。

## 契约

返回值：

- Bool - 如果套接字是通过调用 `close` 显式关闭，则返回 true；否则，返回 false。
