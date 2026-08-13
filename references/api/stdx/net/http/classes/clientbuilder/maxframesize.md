<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.maxframesize" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.maxFrameSize

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func maxFrameSize(size: UInt32): ClientBuilder
```

配置客户端 HTTP/2 初始最大帧大小。

## 契约

参数：

- size: UInt32 - 默认值为 16384。取值范围为 2^14 至 2^24 - 1。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。
