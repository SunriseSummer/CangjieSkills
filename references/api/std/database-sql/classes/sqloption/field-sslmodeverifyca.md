<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.sqloption.field-sslmodeverifyca" parent="std.database.sql.class.sqloption" -->
# SqlOption.SSLModeVerifyCA

[← SqlOption](index.md)

## 签名

```cangjie role=signature
public static const SSLModeVerifyCA: String = "ssl.mode.verify_ca"
```

SSLModeVerifyCA 和 SSLModeRequired 类似，但是增加了校验服务器证书，如果校验失败，则连接失败。

## 契约

类型：String
