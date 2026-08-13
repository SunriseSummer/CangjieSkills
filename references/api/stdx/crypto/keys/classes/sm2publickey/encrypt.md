<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.sm2publickey.encrypt" parent="stdx.crypto.keys.class.sm2publickey" -->
# SM2PublicKey.encrypt

[← SM2PublicKey](index.md)

## 签名

```cangjie role=signature
public func encrypt(input: Array<Byte>): Array<Byte>
```

encrypt 给一段数据进行加密，输出密文遵循 ASN.1 编码规则。

## 契约

参数：

- input: Array\<Byte> - 需要加密的数据。

返回值：

- Array\<Byte> - 加密后的数据。

异常：

- CryptoException - 加密失败，抛出异常。
