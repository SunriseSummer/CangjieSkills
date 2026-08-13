<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponse.prop-ispersistent" parent="stdx.net.http.class.httpresponse" -->
# HttpResponse.isPersistent

[← HttpResponse](index.md)

## 签名

```cangjie role=signature
public prop isPersistent: Bool
```

表示该响应是否为长连接，即响应 header 是否不包含 `Connection: close`。

## 契约

功能：表示该响应是否为长连接，即响应 header 是否不包含 `Connection: close`。包含 `Connection: close` 为 false，否则为 true。

对于服务端，isPersistent 为 false 表示处理完该请求应关闭连接；

对于客户端，isPersistent 为 false 表示读完响应体后客户端应主动关闭连接。

类型：Bool
