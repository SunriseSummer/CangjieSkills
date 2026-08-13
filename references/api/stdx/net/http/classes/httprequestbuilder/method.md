<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.method" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.method

[← HttpRequestBuilder](index.md)

## 签名

```cangjie role=signature
public func method(method: String): HttpRequestBuilder
```

设置请求 method，默认请求 method 为 "GET"。

## 契约

参数：

- method: String - 请求方法，必须由 token 字符组成，如果传入空字符串，method 值将自动设置为 "GET"。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。

异常：

- HttpException - 参数 method 非法时抛出此异常。
