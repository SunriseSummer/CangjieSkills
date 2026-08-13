<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.sqloption.field-tls12ciphersuites" parent="std.database.sql.class.sqloption" -->
# SqlOption.Tls12Ciphersuites

[← SqlOption](index.md)

## 签名

```cangjie role=signature
public static const Tls12Ciphersuites: String = "tls1.2.ciphersuites"
```

此选项指定客户端允许使用 TLSv1.2 及以下的加密连接使用哪些密码套件。

## 契约

功能：此选项指定客户端允许使用 TLSv1.2 及以下的加密连接使用哪些密码套件。
值为冒号分隔的字符串，比如 `TLS_ECDHE_ECDSA_WITH_AES_128_GCM_[SHA256]():TLS_DHE_RSA_WITH_AES_128_CBC_SHA`。

类型：String
