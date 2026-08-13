<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.addheaders" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.addHeaders

[← HttpRequestBuilder](index.md)

## 签名

```cangjie role=signature
public func addHeaders(headers: HttpHeaders): HttpRequestBuilder
```

向请求 header 添加参数 HttpHeaders 中的键值对。

## 契约

参数：

- headers: HttpHeaders - 传入的 header 对象。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。
