<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.maxconcurrentstreams" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.maxConcurrentStreams

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func maxConcurrentStreams(size: UInt32): ServerBuilder
```

HTTP/2 专用，设置本端同时处理的最大请求数量，限制对端并发发送请求的数量，默认值为 100。

## 契约

参数：

- size: UInt32 - 本端同时处理的最大请求数量。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
