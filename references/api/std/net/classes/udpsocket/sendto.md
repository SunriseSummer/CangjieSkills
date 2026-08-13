<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.sendto" parent="std.net.class.udpsocket" -->
# UdpSocket.sendTo

[← UdpSocket](index.md)

## 签名

```cangjie role=signature
public override func sendTo(recipient: SocketAddress, payload: Array<Byte>): Unit
```

发送报文。

## 契约

功能：发送报文。当没有足够的缓存地址时可能会被阻塞。

参数：

- recipient: SocketAddress - 发送的对端地址。
- payload: Array\<Byte> - 发送报文内容。

异常：

- SocketException - 当 `payload` 的大小超出系统限制、系统发送失败（例如：当 `connect` 被调用，并且收到异常 ICMP 报文时，发送失败）、Windows 平台下远端地址为全零地址或者 macOS 平台下 `connect` 被调用后调用 `sendTo` 时，抛出异常。
