<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.nextint16" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.nextInt16

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func nextInt16()

### 签名

```cangjie role=signature
public open func nextInt16(): Int16
```

获取一个 Int16 类型的伪随机数。

### 契约

返回值：

- Int16 - 一个 Int16 类型的伪随机数。

## func nextInt16(Int16)

### 签名

```cangjie role=signature
public open func nextInt16(upper: Int16): Int16
```

获取一个范围在 0, `upper`) 的 [Int16 类型的伪随机数。

### 契约

参数：

- upper: Int16 - 表示生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, Int16.Max]。

返回值：

- Int16 - 一个 Int16 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 小于等于 0，抛出异常。

## func nextInt16()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func nextInt16(): Int16
```

获取一个 Int16 类型的伪随机数。

### 契约

返回值：

- Int16 - 一个 Int16 类型的伪随机数。

## func nextInt16(Int16)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func nextInt16(upper: Int16): Int16
```

获取一个范围在 0, `upper`) 的 [Int16 类型的伪随机数。

### 契约

参数：

- upper: Int16 - 表示生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, Int16.Max]。

返回值：

- Int16 - 一个 Int16 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 小于等于 0，抛出异常。
