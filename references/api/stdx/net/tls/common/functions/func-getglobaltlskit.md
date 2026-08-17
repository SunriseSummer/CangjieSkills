<!-- cj-doc kind="api-member" level="5" id="stdx.net.tls.common.func.func-getglobaltlskit" parent="stdx.net.tls.common" -->
# func getGlobalTlsKit()

[← stdx.net.tls.common](../index.md)

## 签名

```cangjie role=signature
public func getGlobalTlsKit(): TlsKit
```

获取当前全局使用的 TLS 套件。

## 返回值

- TlsKit - 当前全局使用的 TLS 套件。

## 异常

- TlsException - 若未设置全局 TLS 套件，则会抛出异常。

