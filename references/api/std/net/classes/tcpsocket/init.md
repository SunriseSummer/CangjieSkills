<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.init" parent="std.net.class.tcpsocket" -->
# TcpSocket.init

[← TcpSocket](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init(SocketAddress)

### 签名

```cangjie role=signature
public init(address: SocketAddress)
```

创建一个未连接的套接字。

### 契约

参数：

- address: SocketAddress - 即将要连接的地址。

异常：

- SocketException - 当 `address` 参数不合法或者 Windows 平台下地址为全零地址时，抛出异常。

## init(SocketAddress, ?SocketAddress)

### 签名

```cangjie role=signature
public init(address: SocketAddress, localAddress!: ?SocketAddress)
```

创建一个未连接的套接字，并且绑定到指定本地地址，本地地址为 `None` 时，将随机选定地址去绑定。

### 契约

此接口当 `localAddress` 不为 `None` 时，将默认设置 `SO_REUSEADDR` 为 `true`，否则可能导致 "address already in use" 的错误。如果需要变更此配置，可以通过调用 setSocketOptionBool(SocketOptions.SOL_SOCKET, SocketOptions.SO_REUSEADDR, false)。另外，本地地址和远端地址需要均为 IPv4。

参数：

- address: SocketAddress - 即将要连接的地址。
- localAddress!: ?SocketAddress - 绑定的本地地址。

异常：

- SocketException - 当 `address` 参数不合法或者 Windows 平台下地址为全零地址时，抛出异常。

## init(String, UInt16)

### 签名

```cangjie role=signature
public init(address: String, port: UInt16)
```

创建一个未连接的套接字。

### 契约

参数：

- address: String - 即将要连接的地址。
- port: UInt16 - 即将要连接的端口。

异常：

- SocketException - 当 `address` 参数不合法或者 Windows 平台下地址为全零地址时，抛出异常。
