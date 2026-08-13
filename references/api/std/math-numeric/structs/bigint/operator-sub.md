<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.operator-sub" parent="std.math.numeric.struct.bigint" -->
# BigInt.-

[← BigInt](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func -()

### 签名

```cangjie role=signature
public operator func -(): BigInt
```

求 BigInt 的相反数。

### 契约

返回值：

- BigInt - 返回此 BigInt 的相反数。

## operator func -(BigInt)

### 签名

```cangjie role=signature
public operator func -(that: BigInt): BigInt
```

BigInt 减法。

### 契约

参数：

- that: BigInt - 减数。

返回值：

- BigInt - 一个新 BigInt，它是此 BigInt 与另外一个 BigInt 相减后的结果。
