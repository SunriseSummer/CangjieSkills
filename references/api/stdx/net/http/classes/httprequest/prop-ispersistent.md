<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequest.prop-ispersistent" parent="stdx.net.http.class.httprequest" -->
# HttpRequest.isPersistent

[← HttpRequest](index.md)

## 签名

```cangjie role=signature
public prop isPersistent: Bool
```

表示该请求是否为长连接，即请求 header 是否不包含 `Connection: close`。

## 契约

功能：表示该请求是否为长连接，即请求 header 是否不包含 `Connection: close`。包含 `Connection: close` 为 false，否则为 true。

- 对于服务端，isPersistent 为 false 表示处理完该请求应该关闭连接。
- 对于客户端，isPersistent 为 false 表示如果收到响应后服务端未关闭连接，客户端应主动关闭连接。

类型：Bool
