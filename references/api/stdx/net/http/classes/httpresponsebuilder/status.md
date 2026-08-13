<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponsebuilder.status" parent="stdx.net.http.class.httpresponsebuilder" -->
# HttpResponseBuilder.status

[← HttpResponseBuilder](index.md)

## 签名

```cangjie role=signature
public func status(status: UInt16): HttpResponseBuilder
```

设置 http 响应状态码。

## 契约

参数：

- status: UInt16 - 传入的状态码的值。

返回值：

- HttpResponseBuilder - 当前 HttpResponseBuilder 实例的引用。

异常：

- HttpException - 如果设置响应状态码不在 100~599 这个区间内，则抛出此异常。
