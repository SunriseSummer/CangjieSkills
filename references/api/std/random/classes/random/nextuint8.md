<!-- cj-doc kind="api-member" level="6" id="std.random.class.random.nextuint8" parent="std.random.class.random" -->
# Random.nextUInt8

[← Random](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func nextUInt8()

### 签名

```cangjie role=signature
public func nextUInt8(): UInt8
```

获取一个 UInt8 类型的伪随机数。

### 契约

返回值：

- UInt8 - 一个 UInt8 类型的伪随机数。

## func nextUInt8(UInt8)

### 签名

```cangjie role=signature
public func nextUInt8(upper: UInt8): UInt8
```

获取一个范围在 0, `upper`) 的 [UInt8 类型的伪随机数。

### 契约

参数：

- upper: UInt8 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, UInt8.Max]。

返回值：

- UInt8 - 一个 UInt8 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 等于 0，抛出异常。
