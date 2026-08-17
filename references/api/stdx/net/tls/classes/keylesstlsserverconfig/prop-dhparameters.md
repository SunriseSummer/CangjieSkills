<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.keylesstlsserverconfig.prop-dhparameters" parent="stdx.net.tls.class.keylesstlsserverconfig" -->
# KeylessTlsServerConfig.dhParameters

[← KeylessTlsServerConfig](index.md)

## 签名

```cangjie role=signature
public mut prop dhParameters: ?DHParameters
```

指定服务端的 DH 密钥参数，默认为 `None`， 默认情况下使用 openssl 自动生成的参数值。

类型：?DHParameters

