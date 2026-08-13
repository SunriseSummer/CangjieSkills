<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequest.prop-remoteaddr" parent="stdx.net.http.class.httprequest" -->
# HttpRequest.remoteAddr

[← HttpRequest](index.md)

## 签名

```cangjie role=signature
public prop remoteAddr: String
```

用于服务端，获取对端地址，即客户端地址，格式为 ip: port，用户无法设置，自定义的 request 对象调用该属性返回 ""，服务端 handler 中调用该属性返回客户端地址。

## 契约

类型：String
