<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.trailer" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.trailer

[← HttpRequestBuilder](index.md)

## 签名

```cangjie role=signature
public func trailer(name: String, value: String): HttpRequestBuilder
```

向请求 trailer 添加指定键值对，规则同 HttpHeaders 类的 add 函数。

## 契约

参数：

- name: String - 请求头的 key。
- value: String - 请求头的 value。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。

异常：

- HttpException - 如果传入的 name 或 value 包含不合法元素，将抛出此异常。
