<!-- cj-doc kind="api-member" level="6" id="std.core.func.print.print-int64-bool" parent="std.core.func.print" -->
# print(Int64, Bool)

[← print](index.md)

## 签名

```cangjie role=signature
public func print(i: Int64, flush!: Bool = false): Unit
```

向控制台输出 Int64 类型数据的字符串表达。

## 契约

参数：

- i: Int64 - 待输出的 Int64 类型数据。
- flush!: Bool - 是否清空缓存，true 清空，false 不清空，默认 false。
