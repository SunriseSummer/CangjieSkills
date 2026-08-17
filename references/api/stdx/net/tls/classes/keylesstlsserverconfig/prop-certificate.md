<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.keylesstlsserverconfig.prop-certificate" parent="stdx.net.tls.class.keylesstlsserverconfig" -->
# KeylessTlsServerConfig.certificate

[← KeylessTlsServerConfig](index.md)

## 签名

```cangjie role=signature
public mut prop certificate: ?(Array<Certificate>, PrivateKey)
```

设置或获取服务端证书和对应的私钥文件。其中证书必须为 X509Certificate 类型。不可设置为 None。

## 注意
>
该属性返回的 `PrivateKey` 是一个无意义的 dummy key，与 `Array<Certifiace>` 无关。

类型：?(Array<Certificate>, PrivateKey)

## 异常

- TlsException - 设置的服务端证书不是 X509Certificate 类型时，抛出异常；设置服务端证书和对应的私钥文件为 None 时，抛出异常。

