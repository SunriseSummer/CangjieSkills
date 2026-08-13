<!-- cj-doc kind="api-member" level="6" id="std.time.enum.month.of" parent="std.time.enum.month" -->
# Month.of

[← Month](index.md)

## 签名

```cangjie role=signature
public static func of(mon: Int64): Month
```

获取参数 `mon` 对应 Month 类型实例。

## 契约

参数：

- mon: Int64 - 整数形式的月，合法范围为 [1, 12]，分别表示一年中的十二个月。

返回值：

- Month - 参数 `mon` 对应的 Month 类型实例。

异常：

- IllegalArgumentException - 当参数 `mon` 不在 [1, 12] 范围内时，抛出异常。
