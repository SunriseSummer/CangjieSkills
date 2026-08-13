<!-- cj-doc kind="api-member" level="6" id="std.math.func.lcm.lcm-int64-int64" parent="std.math.func.lcm" -->
# lcm(Int64, Int64)

[← lcm](index.md)

## 签名

```cangjie role=signature
public func lcm(x: Int64, y: Int64): Int64
```

求两个 64 位有符号整数的最小的非负的公倍数，当入参有 0 时才返回 0。

## 契约

参数：

- x: Int64 - 传入的需要计算最小公倍数的第一个整数。
- y: Int64 - 传入的需要计算最小公倍数的第二个整数。

返回值：

- Int64 - 返回两个整数的最小的非负的公倍数，当入参有 0 时才返回 0。

异常：

- IllegalArgumentException - 当返回值超出 64 位有符号整数的最大值时抛出异常。
