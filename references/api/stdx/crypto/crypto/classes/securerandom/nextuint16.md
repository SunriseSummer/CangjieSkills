<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.securerandom.nextuint16" parent="stdx.crypto.crypto.class.securerandom" -->
# SecureRandom.nextUInt16

[← SecureRandom](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func nextUInt16()

### 签名

```cangjie role=signature
public func nextUInt16(): UInt16
```

获取一个 UInt16 类型的随机数。

### 契约

返回值：

- UInt16 - 一个 UInt16 类型的随机数。

异常：

- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。

## func nextUInt16(UInt16)

### 签名

```cangjie role=signature
public func nextUInt16(max: UInt16): UInt16
```

获取一个 UInt16 类型且在区间 [0, max) 内的随机数。

### 契约

参数：

- max: UInt16 - 区间最大值。

返回值：

- UInt16 - 一个 UInt16 类型的随机数。

异常：

- IllegalArgumentException - 当 max 为 0 时，抛出异常。
- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。
