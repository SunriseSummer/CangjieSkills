<!-- cj-doc kind="api-member" level="5" id="stdx.crypto.common.func.func-getglobalcryptokit" parent="stdx.crypto.common" -->
# func getGlobalCryptoKit()

[← stdx.crypto.common](../index.md)

## 签名

```cangjie role=signature
public func getGlobalCryptoKit(): CryptoKit
```

获取当前全局使用的加密套件。

## 返回值

- CryptoKit - 当前全局使用的加密套件。

## 异常

- CryptoException - 若未设置全局加密套件，则会抛出异常。

