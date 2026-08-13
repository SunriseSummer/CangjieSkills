<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.priority" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.priority

[← HttpRequestBuilder](index.md)

## 签名

```cangjie role=signature
public func priority(urg: Int64, inc: Bool): HttpRequestBuilder
```

设置 priority 头的便捷函数，调用此函数后，将生成 priority 头，形如："priority: urgency=x, i"。

## 契约

功能：设置 priority 头的便捷函数，调用此函数后，将生成 priority 头，形如："priority: urgency=x, i"。如果通过设置请求头的函数设置了 priority 字段，调用此函数无效。如果多次调用此函数，以最后一次为准。

参数：

- urg: Int64 - 表示请求优先级，取值范围为 [0, 7]，0 表示最高优先级。
- inc: Bool - 表示请求是否需要增量处理，为 true 表示希望服务器并发处理与之同 urg 同 inc 的请求，为 false 表示不希望服务器并发处理。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。

异常：

- HttpException - 当参数 urg 取值非法，即不在 [0, 7] 范围内时，抛出异常。
