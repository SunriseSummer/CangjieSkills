<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.securerandom.init" parent="stdx.crypto.crypto.class.securerandom" -->
# SecureRandom.init

[← SecureRandom](index.md)

## 签名

```cangjie role=signature
public init(priv!: Bool = false)
```

创建 SecureRandom 实例，可指定是否使用更加安全的加密安全伪随机生成器，加密安全伪随机生成器可用于会话密钥和证书私钥等加密场景。

## 契约

参数：

- priv!: Bool - 设置为 true 表示使用加密安全伪随机生成器。
