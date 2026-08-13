<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponsebuilder.setheaders" parent="stdx.net.http.class.httpresponsebuilder" -->
# HttpResponseBuilder.setHeaders

[← HttpResponseBuilder](index.md)

## 签名

```cangjie role=signature
public func setHeaders(headers: HttpHeaders): HttpResponseBuilder
```

设置响应 header，如果已经设置过，调用该函数将替换原 header。

## 契约

参数：

- headers: HttpHeaders - 传入的 header 对象。

返回值：

- HttpResponseBuilder - 当前 HttpResponseBuilder 实例的引用。
