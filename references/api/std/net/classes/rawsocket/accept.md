<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.accept" parent="std.net.class.rawsocket" -->
# RawSocket.accept

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public func accept(timeout!: ?Duration = None): RawSocket
```

接收当前 RawSocket 实例监听时挂起连接队列上的第一个连接请求，返回一个用于通信的 RawSocket。

## 契约

参数：

- timeout!: ?Duration - 等待连接请求的最大时间，默认值 `None` 表示一直等待。

返回值：

- RawSocket - 用于通信的新 RawSocket 实例。

异常：

- SocketException - 当前 RawSocket 实例已经关闭，或接收失败时，抛出异常。
- SocketTimeoutException - 当等待超时时，抛出异常。
