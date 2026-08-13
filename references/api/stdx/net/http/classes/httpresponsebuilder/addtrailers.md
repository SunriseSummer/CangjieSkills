<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponsebuilder.addtrailers" parent="stdx.net.http.class.httpresponsebuilder" -->
# HttpResponseBuilder.addTrailers

[← HttpResponseBuilder](index.md)

## 签名

```cangjie role=signature
public func addTrailers(trailers: HttpHeaders): HttpResponseBuilder
```

向响应 trailer 添加参数 HttpHeaders 中的键值对。

## 契约

参数：

- trailers: HttpHeaders - 传入的 trailer 对象。

返回值：

- HttpResponseBuilder - 当前 HttpResponseBuilder 实例的引用。
