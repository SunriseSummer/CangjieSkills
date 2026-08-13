<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.server.prop-maxrequestbodysize" parent="stdx.net.http.class.server" -->
# Server.maxRequestBodySize

[← Server](index.md)

## 签名

```cangjie role=signature
public prop maxRequestBodySize: Int64
```

获取服务器设定的读取请求的请求体最大值，仅对于 HTTP/1.1 且未设置 "Transfer-Encoding: chunked" 的请求生效。

## 契约

类型：Int64
