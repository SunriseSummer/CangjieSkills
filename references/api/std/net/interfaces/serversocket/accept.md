<!-- cj-doc kind="api-member" level="6" id="std.net.interface.serversocket.accept" parent="std.net.interface.serversocket" -->
# ServerSocket.accept

[← ServerSocket](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func accept()

### 签名

```cangjie role=signature
func accept(): StreamingSocket
```

接受一个客户端套接字的连接请求，阻塞式等待连接请求。

### 契约

返回值：

- StreamingSocket - 连接成功的客户端套接字。

## func accept(?Duration)

### 签名

```cangjie role=signature
func accept(timeout!: ?Duration): StreamingSocket
```

接受一个客户端套接字的连接请求，阻塞式等待连接请求。

### 契约

参数：

- timeout!: ?Duration - 等待连接超时的时间。

返回值：

- StreamingSocket - 连接成功的客户端套接字。

异常：

- SocketTimeoutException - 当等待连接请求超时，抛出异常。
- IllegalArgumentException - 当超时时间小于 0 时，抛出异常。
