<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.sm2privatekey.decrypt" parent="stdx.crypto.keys.class.sm2privatekey" -->
# SM2PrivateKey.decrypt

[← SM2PrivateKey](index.md)

## 签名

```cangjie role=signature
public func decrypt(input: Array<Byte>): Array<Byte>
```

decrypt 解密出原始数据，待解密密文需要遵循 ASN.1 编码规则。

## 契约

参数：

- input: Array\<Byte> - 加密的数据。

返回值：

- Array\<Byte> - 解密后的数据。

异常：

- CryptoException - 解密失败，抛出异常。
