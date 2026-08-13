<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.server.prop-maxframesize" parent="stdx.net.http.class.server" -->
# Server.maxFrameSize

[← Server](index.md)

## 签名

```cangjie role=signature
public prop maxFrameSize: UInt32
```

HTTP/2 专用，用来限制对端发送的报文一个帧的最大长度。

## 契约

功能：HTTP/2 专用，用来限制对端发送的报文一个帧的最大长度。默认值为 16384. 取值范围为 2^14 至 2^24 - 1。

类型：UInt32
