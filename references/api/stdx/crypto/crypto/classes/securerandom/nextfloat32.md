<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.securerandom.nextfloat32" parent="stdx.crypto.crypto.class.securerandom" -->
# SecureRandom.nextFloat32

[← SecureRandom](index.md)

## 签名

```cangjie role=signature
public func nextFloat32(): Float32
```

获取一个 Float32 类型且在区间 [0.0, 1.0) 内的随机数。

## 契约

返回值：

- Float32 - 一个 Float32 类型的随机数。

异常：

- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。
