<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.digest.class.hmac.write" parent="stdx.crypto.digest.class.hmac" -->
# HMAC.write

[← HMAC](index.md)

## 签名

```cangjie role=signature
public func write(buffer: Array<Byte>): Unit
```

使用给定的 buffer 更新 HMAC 对象，在调用 finish 前可以多次更新。

## 契约

参数：

- buffer: Array\<Byte> - 需要追加的字节序列。

异常：

- CryptoException - 当 buffer 为空、finish 已经调用生成信息摘要场景，抛此异常。
