<!-- cj-doc kind="api-member" level="6" id="std.random.class.random.nextbytes" parent="std.random.class.random" -->
# Random.nextBytes

[← Random](index.md)

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

## func nextBytes(Int32)

### 签名

```cangjie role=signature
public func nextBytes(length: Int32): Array<Byte>
```

生成指定长度的随机数数组。

### 契约

参数：

- length: Int32 - 生成的随机数数组长度，`length` 大于 0。

返回值：

- Array\<Byte> - 生成的随机数数组。

异常：

- IllegalArgumentException - 当参数 `length` 小于等于 0 时，抛出异常。
