<!-- cj-doc kind="api-member" level="6" id="std.random.class.random.nextuint64" parent="std.random.class.random" -->
# Random.nextUInt64

[← Random](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func nextUInt64()

### 签名

```cangjie role=signature
public func nextUInt64(): UInt64
```

获取一个 UInt64 类型的伪随机数。

### 契约

返回值：

- UInt64 - 一个 UInt64 类型的伪随机数。

## func nextUInt64(UInt64)

### 签名

```cangjie role=signature
public func nextUInt64(upper: UInt64): UInt64
```

获取一个范围在 0, `upper`) 的 [UInt64 类型的伪随机数。

### 契约

参数：

- upper: UInt64 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, UInt64.Max]。

返回值：

- UInt64 - 一个 UInt64 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 等于 0，抛出异常。
