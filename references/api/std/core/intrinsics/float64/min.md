<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.float64.min" parent="std.core.intrinsic.float64.extension.extend-float64" -->
# Float64.min

[← extend Float64](extensions/extend-float64.md)

## 签名

```cangjie role=signature
public static func min(a: Float64, b: Float64, others: Array<Float64>): Float64
```

返回一组Float64中的最小值，此函数的第三个参数是一个变长参数，可以获取二个以上的Float64最小值，如果参数中有 `NaN`，该函数会返回 `NaN`。

## 契约

参数：

- a: Float64 - 第一个待比较的数。
- b: Float64 - 第二个待比较的数。
- others: Array\<Float64> - 其他待比较的数。

返回值：

- Float64 - 返回参数中的最小值。
