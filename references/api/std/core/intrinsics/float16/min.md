<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.float16.min" parent="std.core.intrinsic.float16.extension.extend-float16" -->
# Float16.min

[← extend Float16](extensions/extend-float16.md)

## 签名

```cangjie role=signature
public static func min(a: Float16, b: Float16, others: Array<Float16>): Float16
```

返回一组Float16中的最小值，此函数的第三个参数是一个变长参数，可以获取二个以上的Float16最小值，如果参数中有 `NaN`，该函数会返回 `NaN`。

## 契约

参数：

- a: Float16 - 第一个待比较的数。
- b: Float16 - 第一个待比较的数。
- others: Array\<Float16> - 其他待比较的数。

返回值：

- Float16 - 返回参数中的最小值。
