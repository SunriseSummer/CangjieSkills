<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.isclosed" parent="std.net.class.udpsocket" -->
# UdpSocket.isClosed

[← UdpSocket](index.md)

## 签名

```cangjie role=signature
public override func isClosed(): Bool
```

判断套接字是否通过调用 `close` 显式关闭。

## 契约

返回值：

- Bool - 如果该套接字已调用 `close` 显示关闭，则返回 `true`；否则，返回 `false`。
