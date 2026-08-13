<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpserversocket.init" parent="std.net.class.tcpserversocket" -->
# TcpServerSocket.init

[← TcpServerSocket](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(SocketAddress)

### 签名

```cangjie role=signature
public init(bindAt!: SocketAddress)
```

创建一个 TcpServerSocket 实例，尚未绑定，因此客户端无法连接。

### 契约

参数：

- bindAt!: SocketAddress - 指定本地绑定地址，端口号设置为 0 表示随机绑定空闲的本地地址。

## init(UInt16)

### 签名

```cangjie role=signature
public init(bindAt!: UInt16)
```

创建一个 TcpServerSocket 实例，尚未绑定，因此客户端无法连接。

### 契约

参数：

- bindAt!: UInt16 - 指定本地绑定端口，0 表示随机绑定空闲的本地端口。
