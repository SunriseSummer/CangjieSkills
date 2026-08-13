<!-- cj-doc kind="api-member" level="6" id="std.math.func.lcm.lcm-int8-int8" parent="std.math.func.lcm" -->
# lcm(Int8, Int8)

[← lcm](index.md)

## 签名

```cangjie role=signature
public func lcm(x: Int8, y: Int8): Int8
```

求两个 8 位有符号整数的最小的非负的公倍数，当入参有 0 时才返回 0。

## 契约

参数：

- x: Int8 - 传入的需要计算最小公倍数的第一个整数。
- y: Int8 - 传入的需要计算最小公倍数的第二个整数。

返回值：

- Int8 - 返回两个整数的最小的非负的公倍数，当入参有 0 时才返回 0。

异常：

- IllegalArgumentException - 当返回值超出 8 位有符号整数的最大值时抛出异常。
