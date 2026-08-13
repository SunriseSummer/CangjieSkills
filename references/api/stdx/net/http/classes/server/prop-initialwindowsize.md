<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.server.prop-initialwindowsize" parent="stdx.net.http.class.server" -->
# Server.initialWindowSize

[← Server](index.md)

## 签名

```cangjie role=signature
public prop initialWindowSize: UInt32
```

HTTP/2 专用，用来限制对端发送的报文 stream 初始流量窗口大小。

## 契约

功能：HTTP/2 专用，用来限制对端发送的报文 stream 初始流量窗口大小。默认值为 65535 ，取值范围为 0 至 2^31 - 1。

类型：UInt32
