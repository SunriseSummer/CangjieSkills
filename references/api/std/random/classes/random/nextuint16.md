<!-- cj-doc kind="api-member" level="6" id="std.random.class.random.nextuint16" parent="std.random.class.random" -->
# Random.nextUInt16

[← Random](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func nextUInt16()

### 签名

```cangjie role=signature
public func nextUInt16(): UInt16
```

获取一个 UInt16 类型的伪随机数。

### 契约

返回值：

- UInt16 - 一个 UInt16 类型的伪随机数。

## func nextUInt16(UInt16)

### 签名

```cangjie role=signature
public func nextUInt16(upper: UInt16): UInt16
```

获取一个范围在 0, `upper`) 的 [UInt16 类型的伪随机数。

### 契约

参数：

- upper: UInt16 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, UInt16.Max]。

返回值：

- UInt16 - 一个 UInt16 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 等于 0，抛出异常。
