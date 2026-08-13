<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.securerandom.nextbool" parent="stdx.crypto.crypto.class.securerandom" -->
# SecureRandom.nextBool

[← SecureRandom](index.md)

## 签名

```cangjie role=signature
public func nextBool(): Bool
```

获取一个随机的 Bool 类型实例。

## 契约

返回值：

- Bool - 一个随机的 Bool 类型实例。

异常：

- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。
