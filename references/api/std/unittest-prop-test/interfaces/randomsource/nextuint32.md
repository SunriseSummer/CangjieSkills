<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.nextuint32" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.nextUInt32

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func nextUInt32()

### 签名

```cangjie role=signature
public open func nextUInt32(): UInt32
```

获取一个 UInt32 类型的伪随机数。

### 契约

返回值：

- UInt32 - 一个 UInt32 类型的伪随机数。

## func nextUInt32(UInt32)

### 签名

```cangjie role=signature
public open func nextUInt32(upper: UInt32): UInt32
```

获取一个范围在 0, `upper`) 的 [UInt32 类型的伪随机数。

### 契约

参数：

- upper: UInt32 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, UInt32.Max]。

返回值：

- UInt32 - 一个 UInt32 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 等于 0，抛出异常。

## func nextUInt32()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func nextUInt32(): UInt32
```

获取一个 UInt32 类型的伪随机数。

### 契约

返回值：

- UInt32 - 一个 UInt32 类型的伪随机数。

## func nextUInt32(UInt32)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func nextUInt32(upper: UInt32): UInt32
```

获取一个范围在 0, `upper`) 的 [UInt32 类型的伪随机数。

### 契约

参数：

- upper: UInt32 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, UInt32.Max]。

返回值：

- UInt32 - 一个 UInt32 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 等于 0，抛出异常。
