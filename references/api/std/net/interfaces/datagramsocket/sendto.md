<!-- cj-doc kind="api-member" level="6" id="std.net.interface.datagramsocket.sendto" parent="std.net.interface.datagramsocket" -->
# DatagramSocket.sendTo

[← DatagramSocket](index.md)

## 签名

```cangjie role=signature
func sendTo(address: SocketAddress, payload: Array<Byte>): Unit
```

发送报文到指定的远端地址，当对端无足够缓存时，此操作可能被阻塞，报文可能被丢弃。

## 契约

参数：

- address: SocketAddress - 需要发送到的远端地址。
- payload: Array\<Byte> - 需要发送的报文内容。
