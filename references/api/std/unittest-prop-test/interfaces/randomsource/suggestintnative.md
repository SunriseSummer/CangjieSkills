<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestintnative" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestIntNative

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestIntNative()

### 签名

```cangjie role=signature
public func suggestIntNative(): IntNative
```

获取一个 IntNative 类型的伪随机数。

### 契约

返回值：

- IntNative - 一个 IntNative 类型的伪随机数。

## func suggestIntNative(IntNative, IntNative)

### 签名

```cangjie role=signature
func suggestIntNative(l: IntNative, r: IntNative): IntNative
```

获取一个 IntNative 类型的伪随机数。

### 契约

参数：

- l: IntNative - 可生成范围的最小值。
- l: IntNative - 可生成范围的最大值。

返回值：

- IntNative - 一个 IntNative 类型的伪随机数。

## func suggestIntNative()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public func suggestIntNative(): IntNative
```

获取一个 IntNative 类型的伪随机数。

### 契约

返回值：

- IntNative - 一个 IntNative 类型的伪随机数。

## func suggestIntNative(IntNative, IntNative)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestIntNative(l: IntNative, r: IntNative): IntNative
```

获取一个 IntNative 类型的伪随机数。

### 契约

参数：

- l: IntNative - 可生成范围的最小值。
- l: IntNative - 可生成范围的最大值。

返回值：

- IntNative - 一个 IntNative 类型的伪随机数。
