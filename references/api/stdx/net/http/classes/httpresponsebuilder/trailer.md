<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponsebuilder.trailer" parent="stdx.net.http.class.httpresponsebuilder" -->
# HttpResponseBuilder.trailer

[← HttpResponseBuilder](index.md)

## 签名

```cangjie role=signature
public func trailer(name: String, value: String): HttpResponseBuilder
```

向响应 trailer 添加指定键值对，规则同 HttpHeaders 类的 add 函数。

## 契约

参数：

- name: String - 响应头的 key。
- value: String - 响应头的 value。

返回值：

- HttpResponseBuilder - 当前 HttpResponseBuilder 实例的引用。

异常：

- HttpException - 如果传入的 name 或 value 包含不合法元素，将抛出此异常。
