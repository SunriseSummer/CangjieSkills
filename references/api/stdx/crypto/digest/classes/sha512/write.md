<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.digest.class.sha512.write" parent="stdx.crypto.digest.class.sha512" -->
# SHA512.write

[← SHA512](index.md)

## 签名

```cangjie role=signature
public func write(buffer: Array<Byte>): Unit
```

使用给定的 buffer 更新 SHA512 对象，在调用 finish 前可以多次更新。

## 契约

参数：

- buffer: Array\<Byte> - 输入字节序列。

异常：

- CryptoException - 已经调用 finish 进行摘要计算后未重置上下文，抛此异常。
