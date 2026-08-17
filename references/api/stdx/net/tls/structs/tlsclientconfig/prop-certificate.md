<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsclientconfig.prop-certificate" parent="stdx.net.tls.struct.tlsclientconfig" -->
# TlsClientConfig.certificate

[← TlsClientConfig](index.md)

## 签名

```cangjie role=signature
public mut prop certificate: ?(Array<Certificate>, PrivateKey)
```

设置或获取客户端证书和对应的私钥文件。其中证书必须为 X509Certificate 类型。

类型：?(Array<Certificate>, PrivateKey)

## 异常

- TlsException - 设置的客户端证书不是 X509Certificate 类型时，抛出异常。

