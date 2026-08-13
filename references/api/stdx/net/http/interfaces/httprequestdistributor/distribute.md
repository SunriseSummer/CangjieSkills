<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.httprequestdistributor.distribute" parent="stdx.net.http.interface.httprequestdistributor" -->
# HttpRequestDistributor.distribute

[← HttpRequestDistributor](index.md)

## 签名

```cangjie role=signature
func distribute(path: String): HttpRequestHandler
```

分发请求处理器，未找到对应请求处理器时，将返回 NotFoundHandler 以返回 404 状态码。

## 契约

参数：

- path: String - 请求路径。

返回值：

- HttpRequestHandler - 返回请求处理器。
