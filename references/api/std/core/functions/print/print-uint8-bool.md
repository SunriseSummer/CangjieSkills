<!-- cj-doc kind="api-member" level="6" id="std.core.func.print.print-uint8-bool" parent="std.core.func.print" -->
# print(UInt8, Bool)

[← print](index.md)

## 签名

```cangjie role=signature
public func print(i: UInt8, flush!: Bool = false): Unit
```

向控制台输出 UInt8 类型数据的字符串表达。

## 契约

参数：

- i: UInt8 - 待输出的 UInt8 类型数据。
- flush!: Bool - 是否清空缓存，true 清空，false 不清空，默认 false。
