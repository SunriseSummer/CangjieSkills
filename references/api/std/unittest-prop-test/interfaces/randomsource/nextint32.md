<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.nextint32" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.nextInt32

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func nextInt32()

### 签名

```cangjie role=signature
public open func nextInt32(): Int32
```

获取一个 Int32 类型的伪随机数。

### 契约

返回值：

- Int32 - 一个 Int32 类型的伪随机数。

## func nextInt32(Int32)

### 签名

```cangjie role=signature
public open func nextInt32(upper: Int32): Int32
```

获取一个范围在 0, `upper`) 的 [Int32 类型的伪随机数。

### 契约

参数：

- upper: Int32 - 表示生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, Int32.Max]。

返回值：

- Int32 - 一个 Int32 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 小于等于 0，抛出异常。

## func nextInt32()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func nextInt32(): Int32
```

获取一个 Int32 类型的伪随机数。

### 契约

返回值：

- Int32 - 一个 Int32 类型的伪随机数。

## func nextInt32(Int32)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func nextInt32(upper: Int32): Int32
```

获取一个范围在 0, `upper`) 的 [Int32 类型的伪随机数。

### 契约

参数：

- upper: Int32 - 表示生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, Int32.Max]。

返回值：

- Int32 - 一个 Int32 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 小于等于 0，抛出异常。
