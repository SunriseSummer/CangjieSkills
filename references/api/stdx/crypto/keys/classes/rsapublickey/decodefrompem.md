<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.rsapublickey.decodefrompem" parent="stdx.crypto.keys.class.rsapublickey" -->
# RSAPublicKey.decodeFromPem

[← RSAPublicKey](index.md)

## 签名

```cangjie role=signature
public static func decodeFromPem(text: String): RSAPublicKey
```

将公钥从 PEM 格式解码。

## 契约

参数：

- text: String - PEM 格式的公钥字符流。

返回值：

- RSAPublicKey - 解码出的 RSA 公钥。

异常：

- CryptoException - 解码失败、字符流不符合 PEM 格式或文件头不符合公钥头标准时，抛出异常。
