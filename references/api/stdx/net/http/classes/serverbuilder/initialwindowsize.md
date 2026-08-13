<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.initialwindowsize" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.initialWindowSize

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func initialWindowSize(size: UInt32): ServerBuilder
```

HTTP/2 专用，设置当前服务器上每个流的接收报文的初始流量窗口大小，默认值为 65535。

## 契约

功能：HTTP/2 专用，设置当前服务器上每个流的接收报文的初始流量窗口大小，默认值为 65535。取值范围为 0 至 2^31 - 1。

参数：

- size: UInt32 - 本端一个 stream 上接收报文的初始流量窗口大小。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
