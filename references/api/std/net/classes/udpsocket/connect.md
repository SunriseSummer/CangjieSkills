<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.connect" parent="std.net.class.udpsocket" -->
# UdpSocket.connect

[← UdpSocket](index.md)

## 签名

```cangjie role=signature
public func connect(remote: SocketAddress): Unit
```

连接特定远端地址，可通过 `disconnect` 撤销配置。

## 契约

仅接受该远端地址的报文。必须在调用 `bind` 后执行。此操作执行后，端口将开始接收 ICMP 报文，若收到异常报文后，可能导致 `send/sendTo` 执行失败。

参数：

- remote: SocketAddress - 远端地址。

异常：

- IllegalArgumentException - 当远端地址不合法时，抛出异常。
- SocketException - 当端口未绑定、连接因系统原因无法建立或者 Windows 平台下远端地址为全零地址时，抛出异常。
