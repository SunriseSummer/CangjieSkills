<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.ecdsapublickey.verify" parent="stdx.crypto.keys.class.ecdsapublickey" -->
# ECDSAPublicKey.verify

[← ECDSAPublicKey](index.md)

## 签名

```cangjie role=signature
public func verify(digest: Array<Byte>, sig: Array<Byte>): Bool
```

verify 验证签名结果。

## 契约

参数：

- digest: Array\<Byte> - 数据的摘要结果。
- sig: Array\<Byte> - 数据的签名结果。

返回值：

- Bool - 返回 true 表示验证成功，false 失败。
