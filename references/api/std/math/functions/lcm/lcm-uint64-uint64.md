<!-- cj-doc kind="api-member" level="6" id="std.math.func.lcm.lcm-uint64-uint64" parent="std.math.func.lcm" -->
# lcm(UInt64, UInt64)

[← lcm](index.md)

## 签名

```cangjie role=signature
public func lcm(x: UInt64, y: UInt64): UInt64
```

求两个 64 位无符号整数的最小的非负的公倍数，当入参有 0 时才返回 0。

## 契约

参数：

- x: UInt64 - 传入的需要计算最小公倍数的第一个整数。
- y: UInt64 - 传入的需要计算最小公倍数的第二个整数。

返回值：

- UInt64 - 返回两个整数的最小的非负的公倍数，当入参有 0 时才返回 0。

异常：

- IllegalArgumentException - 当返回值超出 64 位无符号整数的最大值时抛出异常。
