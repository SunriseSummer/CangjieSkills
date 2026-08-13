<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.websocket.read" parent="stdx.net.http.class.websocket" -->
# WebSocket.read

[← WebSocket](index.md)

## 签名

```cangjie role=signature
public func read(): WebSocketFrame
```

从连接中读取一个帧，如果连接上数据未就绪会阻塞，非线程安全（即对同一个 WebSocket 对象不支持多线程读）。

## 契约

read 函数返回一个 WebSocketFrame 对象，用户可以调用 WebSocketFrame 的 frameType，fin 属性确定其帧类型和是否是分段帧调用。通过 WebSocketFrame 的 payload 函数得到原始二进制数据数组：Array\<UInt8>

- 分段帧的首帧为 fin == false，frameType == TextWebFrame 或 BinaryWebFrame 中间帧 fin == false，frameType == ContinuationWebFrame 尾帧 fin == true， frameType == ContinuationWebFrame；
- 非分段帧为     fin == true， frameType != ContinuationWebFrame。

> **注意：**
>
> - 数据帧（Text，Binary）可以分段，用户需要多次调用 read 将所有分段帧读完（以下称为接收到完整的 message），再将分段帧的 payload 按接收序拼接 Text 帧的 payload 为 UTF-8 编码，用户在接收到完整的 message 后，调用 String.fromUtf8 函数将拼接后的 payload 转成字符串 Binary 帧的 payload 的意义由使用其的应用确定，用户在接收到完整的 message 后，将拼接后的 payload 传给上层应用；
> - 控制帧（Close，Ping，Pong）不可分段；
> - 控制帧本身不可分段，但其可以穿插在分段的数据帧之间。分段的数据帧之间不可出现其他数据帧，如果用户收到穿插的分段数据帧，则需要当作错误处理；
> - 客户端收到 masked 帧，服务器收到 unmasked 帧，断开底层连接并抛出异常；
> - rsv1、rsv2、rsv3 位被设置（暂不支持 extensions，因此 rsv 位必须为 0），断开底层连接并抛出异常；
> - 收到无法理解的帧类型（只支持 Continuation，Text，Binary，Close，Ping，Pong），断开底层连接并抛出异常；
> - 收到分段或 payload 长度大于 125 bytes 的控制帧（Close，Ping，Pong），断开底层连接并抛出异常；
> - 收到 payload 长度大于 20M 的帧，断开底层连接并抛出异常；
> - closeConn 关闭连接后继续调用读，抛出异常。

返回值：

- WebSocketFrame - 读到的 WebSocketFrame 对象。

异常：

- SocketException - 底层连接错误。
- WebSocketException - 收到不符合协议规定的帧，此时会给对端发送 Close 帧说明错误信息，并断开底层连接。
- ConnectionException - 从连接中读数据时对端已关闭连接抛此异常。
