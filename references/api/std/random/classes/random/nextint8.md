<!-- cj-doc kind="api-member" level="6" id="std.random.class.random.nextint8" parent="std.random.class.random" -->
# Random.nextInt8

[← Random](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func nextInt8()

### 签名

```cangjie role=signature
public func nextInt8(): Int8
```

获取一个 Int8 类型的伪随机数。

### 契约

返回值：

- Int8 - 一个 Int8 类型的伪随机数。

## func nextInt8(Int8): Int8

### 签名

```cangjie role=signature
public func nextInt8(upper: Int8): Int8
```

获取一个范围在 0, `upper`) 的 [Int8 类型的伪随机数。

### 契约

参数：

- upper: Int8 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, Int8.Max]。

返回值：

- Int8 - 一个 Int8 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 小于等于 0，抛出异常。
