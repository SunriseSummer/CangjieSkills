<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.securerandom.nextbytes" parent="stdx.crypto.crypto.class.securerandom" -->
# SecureRandom.nextBytes

[← SecureRandom](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func nextBytes(Array<Byte>)

### 签名

```cangjie role=signature
public func nextBytes(bytes: Array<Byte>): Unit
```

生成随机数替换入参数组中的每个元素。

### 契约

参数：

- bytes: Array\<Byte> - 被替换的数组。

异常：

- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。

## func nextBytes(Int32)

### 签名

```cangjie role=signature
public func nextBytes(length: Int32): Array<Byte>
```

获取一个指定长度的随机字节的数组。

### 契约

参数：

- length: Int32 - 要生成的随机字节数组的长度。

返回值：

- Array\<Byte> - 一个随机字节数组。

异常：

- IllegalArgumentException - 当参数 length 小于等于 0，抛出异常。
- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。
