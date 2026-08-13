<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponsebuilder.settrailers" parent="stdx.net.http.class.httpresponsebuilder" -->
# HttpResponseBuilder.setTrailers

[← HttpResponseBuilder](index.md)

## 签名

```cangjie role=signature
public func setTrailers(trailers: HttpHeaders): HttpResponseBuilder
```

设置响应 trailer，如果已经设置过，调用该函数将替换原 trailer。

## 契约

参数：

- trailers: HttpHeaders - 传入的 trailer 对象。

返回值：

- HttpResponseBuilder - 当前 HttpResponseBuilder 实例的引用。
