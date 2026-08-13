<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixserversocket.accept" parent="std.net.class.unixserversocket" -->
# UnixServerSocket.accept

[← UnixServerSocket](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func accept()

### 签名

```cangjie role=signature
public override func accept(): UnixSocket
```

等待接受一个客户端的连接，或从队列中读取连接。

### 契约

返回值：

- UnixSocket - 连接的客户端套接字。

## func accept(?Duration)

### 签名

```cangjie role=signature
public override func accept(timeout!: ?Duration): UnixSocket
```

等待接受一个客户端的连接，或从队列中读取连接。

### 契约

参数：

- timeout!: ?Duration - 超时时间。

返回值：

- UnixSocket - 连接的客户端套接字。

异常：

- SocketTimeoutException - 当连接超时时，抛出异常。
- IllegalArgumentException - 当超时时间小于 0 时，抛出异常。
