<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.ciphersuite.operator-ne" parent="stdx.net.tls.struct.ciphersuite" -->
# CipherSuite.!=

[← CipherSuite](index.md)

## 签名

```cangjie role=signature
public operator func !=(that: CipherSuite): Bool
```

判断两个密码套件是否不等。

## 契约

参数：

- that: CipherSuite - 被比较的密码套件对象。

返回值：

- Bool - 若不等，则返回 `true`；反之，返回 `false`。
