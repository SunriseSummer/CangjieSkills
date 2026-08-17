<!-- cj-doc kind="api-member" level="5" id="stdx.net.tls.type.type-keylessdecryptfunc" parent="stdx.net.tls" -->
# type KeylessDecryptFunc

[← stdx.net.tls](../index.md)

## 签名

```cangjie role=signature
public type KeylessDecryptFunc = (cipherText: Array<Byte>) -> Array<Byte>
```

供无私钥握手使用的解密回调函数类型。

