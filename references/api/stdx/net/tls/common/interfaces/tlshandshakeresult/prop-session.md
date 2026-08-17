<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.common.interface.tlshandshakeresult.prop-session" parent="stdx.net.tls.common.interface.tlshandshakeresult" -->
# TlsHandshakeResult.session

[← TlsHandshakeResult](index.md)

## 签名

```cangjie role=signature
prop session: ?TlsSession
```

获取 TLS 会话。客户端可在握手成功后捕获当前会话，后续可重用该会话。

类型：?TlsSession

