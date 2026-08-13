<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.securerandom.nextfloat16" parent="stdx.crypto.crypto.class.securerandom" -->
# SecureRandom.nextFloat16

[← SecureRandom](index.md)

## 签名

```cangjie role=signature
public func nextFloat16(): Float16
```

获取一个 Float16 类型且在区间 [0.0, 1.0) 内的随机数。

## 契约

返回值：

- Float16 - 一个 Float16 类型的随机数。

异常：

- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。
