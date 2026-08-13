<!-- cj-doc kind="api-member" level="6" id="std.math.func.gcd.gcd-int8-int8" parent="std.math.func.gcd" -->
# gcd(Int8, Int8)

[← gcd](index.md)

## 签名

```cangjie role=signature
public func gcd(x: Int8, y: Int8): Int8
```

求两个 8 位有符号整数的最大公约数。

## 契约

参数：

- x: Int8 - 传入的需要计算最大公约数的第一个整数。
- y: Int8 - 传入的需要计算最大公约数的第二个整数。

返回值：

- Int8 - 返回两个整数的最大公约数。

异常：

- IllegalArgumentException - 当两参数都为有符号整数最小值，或一个参数为有符号整数的最小值且另一个参数为 0 时，抛出异常。
