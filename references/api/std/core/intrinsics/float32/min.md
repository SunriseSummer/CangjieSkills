<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.float32.min" parent="std.core.intrinsic.float32.extension.extend-float32" -->
# Float32.min

[← extend Float32](extensions/extend-float32.md)

## 签名

```cangjie role=signature
public static func min(a: Float32, b: Float32, others: Array<Float32>): Float32
```

返回一组Float32中的最小值，此函数的第三个参数是一个变长参数，可以获取二个以上的Float32最小值，如果参数中有 `NaN`，该函数会返回 `NaN`。

## 契约

参数：

- a: Float32 - 第一个待比较的数。
- b: Float32 - 第二个待比较的数。
- others: Array\<Float32> - 其他待比较的数。

返回值：

- Float32 - 返回参数中的最小值。
