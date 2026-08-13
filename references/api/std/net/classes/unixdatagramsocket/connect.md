<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixdatagramsocket.connect" parent="std.net.class.unixdatagramsocket" -->
# UnixDatagramSocket.connect

[← UnixDatagramSocket](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func connect(SocketAddress)

### 签名

```cangjie role=signature
public func connect(remote: SocketAddress): Unit
```

连接特定远端地址，可通过 `disconnect` 撤销配置。

### 契约

仅接受该远端地址的报文。默认执行 `bind`，因此不需额外调用 `bind`。此操作执行后，端口将开始接收 ICMP 报文，若收到异常报文后，可能导致 `send/sendTo` 执行失败。

参数：

- remote: SocketAddress - 远端套接字地址。

异常：

- SocketException - 当地址未绑定时，抛出异常。

## func connect(String)

### 签名

```cangjie role=signature
public func connect(remotePath: String): Unit
```

连接特定远端地址，可通过 `disconnect` 撤销配置。

### 契约

仅接受该远端地址的报文。必须在 `bind` 后调用。此操作执行后，端口将开始接收 ICMP 报文，若收到异常报文后，可能导致 `send/sendTo` 执行失败。

参数：

- remotePath: String - 远端文件地址。

异常：

- SocketException - 当地址未绑定时，抛出异常。
