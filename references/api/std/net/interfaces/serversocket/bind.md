<!-- cj-doc kind="api-member" level="6" id="std.net.interface.serversocket.bind" parent="std.net.interface.serversocket" -->
# ServerSocket.bind

[← ServerSocket](index.md)

## 签名

```cangjie role=signature
func bind(): Unit
```

绑定套接字。

## 契约

当没有设置 `reuse` 属性，本地端口、地址、文件路径已被占用或者上次绑定套接字的连接失败后需要 `close` 套接字。不支持多次重试此操作后可执行 `accept()` 操作。

异常：

- SocketException - 当因系统原因绑定失败时，抛出异常。
