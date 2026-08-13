<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.connect" parent="std.net.class.rawsocket" -->
# RawSocket.connect

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public func connect(addr: RawAddress, timeout!: ?Duration = None): Unit
```

向目标地址发送连接请求。

## 契约

参数：

- addr: RawAddress - 发送连接请求的目标地址。
- timeout!: ?Duration - 等待连接接收的最大时间，默认值 `None` 表示一直等待。

异常：

- SocketException - 当前 RawSocket 实例已经关闭，或接收失败时，抛出异常。
- SocketTimeoutException - 当等待超时时，抛出异常。
