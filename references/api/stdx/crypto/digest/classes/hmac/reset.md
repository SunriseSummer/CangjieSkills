<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.digest.class.hmac.reset" parent="stdx.crypto.digest.class.hmac" -->
# HMAC.reset

[← HMAC](index.md)

## 签名

```cangjie role=signature
public func reset(): Unit
```

重置 HMAC 对象到初始状态，清理 HMAC 上下文。

## 契约

异常：

- CryptoException - 当内部错误，重置失败，抛此异常。
