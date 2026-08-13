<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.nextuint64" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.nextUInt64

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func nextUInt64()

### 签名

```cangjie role=signature
public open func nextUInt64(): UInt64
```

获取一个 UInt64 类型的伪随机数。

### 契约

返回值：

- UInt64 - 一个 UInt64 类型的伪随机数。

## func nextUInt64(UInt64)

### 签名

```cangjie role=signature
public open func nextUInt64(upper: UInt64): UInt64
```

获取一个范围在 0, `upper`) 的 [UInt64 类型的伪随机数。

### 契约

参数：

- upper: UInt64 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, UInt64.Max]。

返回值：

- UInt64 - 一个 UInt64 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 等于 0，抛出异常。

## func nextUInt64()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func nextUInt64(): UInt64
```

获取一个 UInt64 类型的伪随机数。

### 契约

返回值：

- UInt64 - 一个 UInt64 类型的伪随机数。

## func nextUInt64(UInt64)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func nextUInt64(upper: UInt64): UInt64
```

获取一个范围在 0, `upper`) 的 [UInt64 类型的伪随机数。

### 契约

参数：

- upper: UInt64 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, UInt64.Max]。

返回值：

- UInt64 - 一个 UInt64 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 等于 0，抛出异常。
