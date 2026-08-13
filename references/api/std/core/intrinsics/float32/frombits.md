<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.float32.frombits" parent="std.core.intrinsic.float32.extension.extend-float32-2" -->
# Float32.fromBits

[← extend Float32](extensions/extend-float32-2.md)

## 签名

```cangjie role=signature
public static func fromBits(bits: UInt32): Float32
```

将指定的 UInt32 类型转换为 Float32 类型。

## 契约

参数：

- bits: UInt32 - 要转换的数字。

返回值：

- Float32 - 转换结果，其位与参数 bits 值相同。
