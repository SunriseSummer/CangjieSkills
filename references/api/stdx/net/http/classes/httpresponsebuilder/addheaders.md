<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponsebuilder.addheaders" parent="stdx.net.http.class.httpresponsebuilder" -->
# HttpResponseBuilder.addHeaders

[← HttpResponseBuilder](index.md)

## 签名

```cangjie role=signature
public func addHeaders(headers: HttpHeaders): HttpResponseBuilder
```

向响应 header 添加参数 HttpHeaders 中的键值对。

## 契约

参数：

- headers: HttpHeaders - 传入的 header 对象。

返回值：

- HttpResponseBuilder - 当前 HttpResponseBuilder 实例的引用。
