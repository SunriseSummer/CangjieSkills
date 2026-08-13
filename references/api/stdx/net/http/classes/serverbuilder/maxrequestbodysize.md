<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.maxrequestbodysize" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.maxRequestBodySize

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func maxRequestBodySize(size: Int64): ServerBuilder
```

设置服务端允许客户端发送单个请求的请求体最大长度，请求体长度超过该值时，将返回状态码为 413 的响应。

## 契约

功能：设置服务端允许客户端发送单个请求的请求体最大长度，请求体长度超过该值时，将返回状态码为 413 的响应。默认值为 2M。仅对于 HTTP/1.1 且未设置 "Transfer-Encoding: chunked" 的请求生效。

参数：

- size: Int64 - 设定允许接收请求的请求体大小最大值，值为 0 代表不作限制。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。

异常：

- IllegalArgumentException - 当入参 size < 0 时，抛出异常。
