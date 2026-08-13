<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.version" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.version

[← HttpRequestBuilder](index.md)

## 签名

```cangjie role=signature
public func version(version: Protocol): HttpRequestBuilder
```

设置请求的 http 协议版本，默认为 UnknownProtocol("")，客户端会根据 tls 配置自动选择协议。

## 契约

参数：

- version: Protocol - 协议版本。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。
