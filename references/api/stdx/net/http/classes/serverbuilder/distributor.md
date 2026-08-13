<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.distributor" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.distributor

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func distributor(distributor: HttpRequestDistributor): ServerBuilder
```

设置请求分发器，请求分发器会根据 url 将请求分发给对应的 handler。

## 契约

功能：设置请求分发器，请求分发器会根据 url 将请求分发给对应的 handler。不设置时使用默认请求分发器。

参数：

- distributor: HttpRequestDistributor - 自定义请求分发器实例。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
