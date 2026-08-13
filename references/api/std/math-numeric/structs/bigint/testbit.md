<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.testbit" parent="std.math.numeric.struct.bigint" -->
# BigInt.testBit

[← BigInt](index.md)

## 签名

```cangjie role=signature
public func testBit(index: Int64): Bool
```

判断指定位置的 bit 信息，如果指定位置的 bit 为 0，则返回 false；为 1，则返回 true。

## 契约

参数：

- index: Int64 - 需要知道的 bit 的索引。`index` 需要大于等于 0。

返回值：

- Bool - 指定位置的 bit 信息。

异常：

- IllegalArgumentException - 如果入参 `index` 小于 0，则抛此异常。
