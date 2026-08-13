<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.connect" parent="std.net.class.tcpsocket" -->
# TcpSocket.connect

[← TcpSocket](index.md)

## 签名

```cangjie role=signature
public func connect(timeout!: ?Duration = None): Unit
```

连接远端套接字，会自动绑定本地地址，因此不需要进行额外的绑定操作。

## 契约

参数：

- timeout!: ?Duration - 连接超时时间，`None` 表示无超时时间，并且连接操作无重试，当服务端拒绝连接时，将返回连接失败。并且此操作包含了绑定操作，因此无需重复调用 `bind` 接口。

异常：

- IllegalArgumentException - 当远端地址不合法或者连接超时时间小于 0 或者超时时间小于 0 时，抛出异常。
- SocketException - 当连接因系统原因（例如：套接字已关闭，没有访问权限，系统错误等）无法建立时，抛出异常。再次调用可能成功。
- SocketTimeoutException - 当连接超时时，抛出异常。
