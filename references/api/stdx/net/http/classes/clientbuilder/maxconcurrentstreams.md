<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.maxconcurrentstreams" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.maxConcurrentStreams

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func maxConcurrentStreams(size: UInt32): ClientBuilder
```

配置客户端 HTTP/2 初始最大并发流数量。

## 契约

参数：

- size: UInt32 - 默认值为 2^31 - 1。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。
