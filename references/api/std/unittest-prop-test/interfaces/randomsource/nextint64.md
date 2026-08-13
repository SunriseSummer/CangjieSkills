<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.nextint64" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.nextInt64

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func nextInt64()

### 签名

```cangjie role=signature
public open func nextInt64(): Int64
```

获取一个 Int64 类型的伪随机数。

### 契约

返回值：

- Int64 - 一个 Int64 类型的伪随机数。

## func nextInt64(Int64)

### 签名

```cangjie role=signature
public open func nextInt64(upper: Int64): Int64
```

获取一个范围在 0, `upper`) 的 [Int64 类型的伪随机数。

### 契约

参数：

- upper: Int64 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, Int64.Max]。

返回值：

- Int64 - 一个 Int64 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 小于等于 0，抛出异常。

## func nextInt64()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func nextInt64(): Int64
```

获取一个 Int64 类型的伪随机数。

### 契约

返回值：

- Int64 - 一个 Int64 类型的伪随机数。

## func nextInt64(Int64)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func nextInt64(upper: Int64): Int64
```

获取一个范围在 0, `upper`) 的 [Int64 类型的伪随机数。

### 契约

参数：

- upper: Int64 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, Int64.Max]。

返回值：

- Int64 - 一个 Int64 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 小于等于 0，抛出异常。
