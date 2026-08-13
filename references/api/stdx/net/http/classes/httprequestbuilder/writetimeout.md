<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.writetimeout" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.writeTimeout

[← HttpRequestBuilder](index.md)

## 签名

```cangjie role=signature
public func writeTimeout(timeout: Duration): HttpRequestBuilder
```

设置此请求的写超时时间。

## 契约

功能：设置此请求的写超时时间。如果传入的 Duration 为负，则会自动转为 0。如果用户设置了此写超时时间，那么该请求的写超时以此为准；如果用户没有设置，那么该请求的写超时以 Client 为准。

参数：

- timeout: Duration - 用户设置的此请求的写超时时间。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。
