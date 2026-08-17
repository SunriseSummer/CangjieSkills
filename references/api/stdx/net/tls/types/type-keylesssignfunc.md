<!-- cj-doc kind="api-member" level="5" id="stdx.net.tls.type.type-keylesssignfunc" parent="stdx.net.tls" -->
# type KeylessSignFunc

[← stdx.net.tls](../index.md)

## 签名

```cangjie role=signature
public type KeylessSignFunc = (hashValue: Array<Byte>) -> Array<Byte>
```

供无私钥握手使用的签名回调函数类型。

