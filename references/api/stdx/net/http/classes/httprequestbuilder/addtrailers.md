<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.addtrailers" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.addTrailers

[← HttpRequestBuilder](index.md)

## 签名

```cangjie role=signature
public func addTrailers(trailers: HttpHeaders): HttpRequestBuilder
```

向请求 trailer 添加参数 HttpHeaders 中的键值对。

## 契约

参数：

- trailers: HttpHeaders - 传入的 trailer 对象。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。
