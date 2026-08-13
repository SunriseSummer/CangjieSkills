<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.server.prop-maxrequestheadersize" parent="stdx.net.http.class.server" -->
# Server.maxRequestHeaderSize

[← Server](index.md)

## 签名

```cangjie role=signature
public prop maxRequestHeaderSize: Int64
```

获取服务器设定的读取请求的请求头最大值。

## 契约

功能：获取服务器设定的读取请求的请求头最大值。仅对 HTTP/1.1 生效，HTTP/2 中有专门的配置 maxHeaderListSize。

类型：Int64
