<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpserversocket.accept" parent="std.net.class.tcpserversocket" -->
# TcpServerSocket.accept

[← TcpServerSocket](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func accept()

### 签名

```cangjie role=signature
public override func accept(): TcpSocket
```

监听或接受客户端连接。

### 契约

功能：监听或接受客户端连接。阻塞等待。

返回值：

- TcpSocket - 客户端套接字。

异常：

- SocketException - 当因系统原因监听失败时，抛出异常。

## func accept(?Duration)

### 签名

```cangjie role=signature
public override func accept(timeout!: ?Duration): TcpSocket
```

监听或接受客户端连接。

### 契约

参数：

- timeout!: ?Duration - 超时时间。

返回值：

- TcpSocket - 客户端套接字。

异常：

- SocketTimeoutException - 当连接超时，抛出异常。
- SocketException - 当因系统原因监听失败时，抛出异常。
- IllegalArgumentException - 当超时时间小于 0 时，抛出异常。
