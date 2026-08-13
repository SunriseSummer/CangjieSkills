<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.sendto" parent="std.net.class.rawsocket" -->
# RawSocket.sendTo

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public func sendTo(addr: RawAddress, buffer: Array<Byte>, flags: Int32): Unit
```

向目标地址发送数据。

## 契约

功能：向目标地址发送数据。若 RawSocket 是 `DATAGRAM` 类型，发送的数据包大小不允许超过 65507 字节。

参数：

- addr: RawAddress - 发送数据的目标地址。
- buffer: Array\<Byte> - 数据。
- flags: Int32 - 指定函数行为的标志。

异常：

- SocketException - 当前 RawSocket 实例已经关闭、发送数据失败或者 macOS 平台下 `connect` 被调用后调用 `sendTo` 时，抛出异常。
- SocketTimeoutException - 当超过指定的写超时时间时，抛出异常。
