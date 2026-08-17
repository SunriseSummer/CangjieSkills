<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.interface.privatekey.encodetopem" parent="stdx.crypto.common.interface.privatekey" -->
# PrivateKey.encodeToPem

[← PrivateKey](index.md)

## 签名

```cangjie role=signature
func encodeToPem(password!: ?String): PemEntry
```

将私钥加密编码成 PEM 格式，密码为 None 时则不加密。

## 参数

- password!: ?String - 加密密码。

## 返回值

- PemEntry - 加密后的 PEM 格式的私钥。

