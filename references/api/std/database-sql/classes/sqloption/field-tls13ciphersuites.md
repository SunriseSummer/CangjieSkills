<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.sqloption.field-tls13ciphersuites" parent="std.database.sql.class.sqloption" -->
# SqlOption.Tls13Ciphersuites

[← SqlOption](index.md)

## 签名

```cangjie role=signature
public static const Tls13Ciphersuites: String = "tls1.3.ciphersuites"
```

此选项指定客户端允许使用 TLSv1.3 的加密连接使用哪些密码套件。

## 契约

功能：此选项指定客户端允许使用 TLSv1.3 的加密连接使用哪些密码套件。
值为冒号分隔的字符串，比如 `TLS_AES_256_GCM_[SHA384]():TLS_CHACHA20_POLY1305_[SHA256]()`。

类型：String
