<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.websocket.write" parent="stdx.net.http.class.websocket" -->
# WebSocket.write

[← WebSocket](index.md)

## 签名

```cangjie role=signature
public func write(frameType: WebSocketFrameType, byteArray: Array<UInt8>, frameSize!: Int64 = FRAMESIZE): Unit
```

发送数据，非线程安全（即对同一个 WebSocket 对象不支持多线程写）。

## 契约

> **注意：**
>
> write 函数将数据以 WebSocket 帧的形式发送给对端；
>
> - 如果发送数据帧（Text，Binary），传入的 byteArray 如果大于 frameSize（默认 4 * 1024 bytes），我们会将其分成小于等于 frameSize 的 payload 以分段帧的形式发送，否则不分段；
> - 如果发送控制帧（Close，Ping，Pong），传入的 byteArray 的大小需要小于等于 125 bytes，Close 帧的前两个字节为状态码，可用的状态码见 RFC 6455 7.4. Status Codes 协议规定，Close 帧发送之后，禁止再发送数据帧，如果发送则会抛出异常；
> - 用户需要自己保证其传入的 byteArray 符合协议，如 Text 帧的 payload 需要是 UTF-8 编码，如果数据帧设置了 frameSize，那么需要大于 0，否则抛出异常；
> - 发送数据帧时，frameSize 小于等于 0，抛出异常；
> - 用户发送控制帧时，传入的数据大于 125 bytes，抛出异常；
> - 用户传入非 Text，Binary，Close，Ping，Pong 类型的帧类型，抛出异常；
> - 发送 Close 帧时传入非法的状态码，或 reason 数据超过 123 bytes，抛出异常；
> - 发送完 Close 帧后继续发送数据帧，抛出异常；
> - closeConn 关闭连接后调用写，抛出异常。

参数：

- frameType: WebSocketFrameType - 所需发送的帧的类型。
- byteArray: Array\<UInt8> - 所需发送的帧的 payload（二进制形式）。
- frameSize!: Int64 - 分段帧的大小，默认为 4 * 1024 bytes，frameSize 不会对控制帧生效（控制帧设置了无效）。

异常：

- SocketException - 底层连接错误时抛出异常。
- WebSocketException - 传入非法的帧类型，或者数据时抛出异常。
