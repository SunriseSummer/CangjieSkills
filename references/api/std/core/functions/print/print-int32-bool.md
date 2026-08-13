<!-- cj-doc kind="api-member" level="6" id="std.core.func.print.print-int32-bool" parent="std.core.func.print" -->
# print(Int32, Bool)

[← print](index.md)

## 签名

```cangjie role=signature
public func print(i: Int32, flush!: Bool = false): Unit
```

向控制台输出 Int32 类型数据的字符串表达。

## 契约

参数：

- i: Int32 - 待输出的 Int32 类型数据。
- flush!: Bool - 是否清空缓存，true 清空，false 不清空，默认 false。
