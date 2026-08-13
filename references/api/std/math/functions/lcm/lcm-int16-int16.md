<!-- cj-doc kind="api-member" level="6" id="std.math.func.lcm.lcm-int16-int16" parent="std.math.func.lcm" -->
# lcm(Int16, Int16)

[← lcm](index.md)

## 签名

```cangjie role=signature
public func lcm(x: Int16, y: Int16): Int16
```

求两个 16 位有符号整数的最小的非负的公倍数，当入参有 0 时才返回 0。

## 契约

参数：

- x: Int16 - 传入的需要计算最小公倍数的第一个整数。
- y: Int16 - 传入的需要计算最小公倍数的第二个整数。

返回值：

- Int16 - 返回两个整数的最小的非负的公倍数，当入参有 0 时才返回 0。

异常：

- IllegalArgumentException - 当返回值超出 16 位有符号整数的最大值时抛出异常。
