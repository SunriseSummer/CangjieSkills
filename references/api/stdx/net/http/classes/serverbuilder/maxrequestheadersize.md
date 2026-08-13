<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.maxrequestheadersize" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.maxRequestHeaderSize

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func maxRequestHeaderSize(size: Int64): ServerBuilder
```

设定服务端允许客户端发送单个请求的请求头最大长度，请求头长度超过该值时，将返回状态码为 431 的响应；仅对 HTTP/1.1 生效，HTTP/2 中有专门的配置 maxHeaderListSize。

## 契约

参数：

- size: Int64 - 设定允许接收请求的请求头大小最大值，值为 0 代表不作限制。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。

异常：

- IllegalArgumentException - 当入参 size < 0 时，抛出异常。
