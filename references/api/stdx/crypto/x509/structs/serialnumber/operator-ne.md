<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.serialnumber.operator-ne" parent="stdx.crypto.x509.struct.serialnumber" -->
# SerialNumber.!=

[← SerialNumber](index.md)

## 签名

```cangjie role=signature
public override operator func !=(other: SerialNumber): Bool
```

判不等。

## 契约

参数：

- other: SerialNumber - 被比较的证书序列号对象。

返回值：

- Bool - 若序列号不同，返回 true；否则，返回 false。
