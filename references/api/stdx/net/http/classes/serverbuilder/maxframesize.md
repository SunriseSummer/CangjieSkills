<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.maxframesize" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.maxFrameSize

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func maxFrameSize(size: UInt32): ServerBuilder
```

HTTP/2 专用，设置本端接收的一个帧的最大长度，用来限制对端发送帧的长度，默认值为 16384. 取值范围为 2^14 至 2^24 - 1。

## 契约

参数：

- size: UInt32 - 本端接收的一个帧的最大长度。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
