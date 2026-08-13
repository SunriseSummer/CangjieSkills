<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestuintnative" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestUIntNative

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestUIntNative()

### 签名

```cangjie role=signature
public func suggestUIntNative(): UIntNative
```

获取一个 UIntNative 类型的伪随机数。

### 契约

返回值：

- UIntNative - 一个 UIntNative 类型的伪随机数。

## func suggestUIntNative(UIntNative, UIntNative)

### 签名

```cangjie role=signature
func suggestUIntNative(l: UIntNative, r: UIntNative): UIntNative
```

获取一个 UIntNative 类型的伪随机数。

### 契约

参数：

- l: UIntNative - 可生成范围的最小值。
- l: UIntNative - 可生成范围的最大值。

返回值：

- UIntNative - 一个 UIntNative 类型的伪随机数。

## func suggestUIntNative()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public func suggestUIntNative(): UIntNative
```

获取一个 UIntNative 类型的伪随机数。

### 契约

返回值：

- UIntNative - 一个 UIntNative 类型的伪随机数。

## func suggestUIntNative(UIntNative, UIntNative)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestUIntNative(l: UIntNative, r: UIntNative): UIntNative
```

获取一个 UIntNative 类型的伪随机数。

### 契约

参数：

- l: UIntNative - 可生成范围的最小值。
- l: UIntNative - 可生成范围的最大值。

返回值：

- UIntNative - 一个 UIntNative 类型的伪随机数。
