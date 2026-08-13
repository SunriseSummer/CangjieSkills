<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixsocket.connect" parent="std.net.class.unixsocket" -->
# UnixSocket.connect

[← UnixSocket](index.md)

## 签名

```cangjie role=signature
public func connect(timeout!: ?Duration = None): Unit
```

建立远端连接，对端拒绝时连接失败，会自动绑定本地地址，因此不需要进行额外的绑定操作。

## 契约

参数：

- timeout!: ?Duration - 超时时间，`None` 表示无超时时间。Unix 与 Tcp 不同，队列已满时，调用立即返回错误，而非重试阻塞等待。

异常：

- IllegalArgumentException - 当远端地址不合法或者超时时间小于 0 时，抛出异常。
- SocketException - 当连接因系统原因无法建立时。抛出异常。
- SocketTimeoutException - 当连接超时时。抛出异常。
