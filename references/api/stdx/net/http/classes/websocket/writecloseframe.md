<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.websocket.writecloseframe" parent="stdx.net.http.class.websocket" -->
# WebSocket.writeCloseFrame

[← WebSocket](index.md)

## 签名

```cangjie role=signature
public func writeCloseFrame(status!: ?UInt16 = None, reason!: String = ""): Unit
```

发送 Close 帧。

## 契约

> **注意：**
>
> 协议规定，Close 帧发送之后，禁止再发送数据帧。如果用户不设置 status，那么 reason 不会被发送（即有 reason 必有 status）；控制帧的 payload 不超过 125 bytes，Close 帧的前两个 bytes 为 status，因此 reason 不能超过 123 bytes，closeConn 关闭连接后调用写，抛出异常。

参数：

- status!: ?UInt16 - 发送的 Close 帧的状态码，默认为 None，表示不发送状态码和 reason。
- reason!: String - 关闭连接的说明，默认为空字符串，发送时会转成 UTF-8，不保证可读，debug 用。

异常：

- WebSocketException - 传入非法的状态码，或 reason 数据超过 123 bytes 时抛出异常。
