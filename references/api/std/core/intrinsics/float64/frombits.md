<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.float64.frombits" parent="std.core.intrinsic.float64.extension.extend-float64-2" -->
# Float64.fromBits

[← extend Float64](extensions/extend-float64-2.md)

## 签名

```cangjie role=signature
public static func fromBits(bits: UInt64): Float64
```

将指定的 UInt64 数转换为 Float64 数。

## 契约

参数：

- bits: UInt64 - 要转换的数字。

返回值：

- Float64 - 转换结果，其位与参数 bits 值相同。
