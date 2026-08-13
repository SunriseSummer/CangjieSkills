<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsclientconfig.prop-signaturealgorithms" parent="stdx.net.tls.struct.tlsclientconfig" -->
# TlsClientConfig.signatureAlgorithms

[← TlsClientConfig](index.md)

## 签名

```cangjie role=signature
public mut prop signatureAlgorithms: ?Array<SignatureAlgorithm>
```

指定保序的签名和哈希算法。

## 契约

功能：指定保序的签名和哈希算法。在值为 `None` 或者列表为空时，客户端会使用默认的列表。指定列表后，客户端可能不会发送不合适的签名算法。
参见 RFC5246 7.4.1.4.1 (TLS 1.2) 章节， RFC8446 4.2.3. (TLS 1.3) 章节。

类型：?Array\<SignatureAlgorithm>
