<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.securerandom.nextint32" parent="stdx.crypto.crypto.class.securerandom" -->
# SecureRandom.nextInt32

[← SecureRandom](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func nextInt32()

### 签名

```cangjie role=signature
public func nextInt32(): Int32
```

获取一个 Int32 类型的随机数。

### 契约

返回值：

- Int32 - 一个 Int32 类型的随机数。

异常：

- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。

## func nextInt32(Int32)

### 签名

```cangjie role=signature
public func nextInt32(max: Int32): Int32
```

获取一个 Int32 类型且在区间 [0, max) 内的随机数。

### 契约

参数：

- max: Int32 - 区间最大值。

返回值：

- Int32 - 一个 Int32 类型的随机数。

异常：

- IllegalArgumentException - 当 max 为非正数时，抛出异常。
- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。
