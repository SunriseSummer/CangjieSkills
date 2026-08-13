<!-- cj-doc kind="api-member" level="6" id="std.math.func.lcm.lcm-int32-int32" parent="std.math.func.lcm" -->
# lcm(Int32, Int32)

[← lcm](index.md)

## 签名

```cangjie role=signature
public func lcm(x: Int32, y: Int32): Int32
```

求两个 32 位有符号整数的最小的非负的公倍数，当入参有 0 时才返回 0。

## 契约

参数：

- x: Int32 - 传入的需要计算最小公倍数的第一个整数。
- y: Int32 - 传入的需要计算最小公倍数的第二个整数。

返回值：

- Int32 - 返回两个整数的最小的非负的公倍数，当入参有 0 时才返回 0。

异常：

- IllegalArgumentException - 当返回值超出 32 位有符号整数的最大值时抛出异常。
