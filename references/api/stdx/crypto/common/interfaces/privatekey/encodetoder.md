<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.interface.privatekey.encodetoder" parent="stdx.crypto.common.interface.privatekey" -->
# PrivateKey.encodeToDer

[← PrivateKey](index.md)

## 签名

```cangjie role=signature
func encodeToDer(password!: ?String): DerBlob
```

将私钥加密编码成 DER 格式，密码为 None 时则不加密。

## 参数

- password!: ?String - 加密密码。

## 返回值

- DerBlob - 加密后的 DER 格式的私钥。

