<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.setheaders" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.setHeaders

[← HttpRequestBuilder](index.md)

## 签名

```cangjie role=signature
public func setHeaders(headers: HttpHeaders): HttpRequestBuilder
```

设置请求 header，如果已经设置过，调用该函数将替换原 header。

## 契约

参数：

- headers: HttpHeaders - 传入的 header 对象。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。
