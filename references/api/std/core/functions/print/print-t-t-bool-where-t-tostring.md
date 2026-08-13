<!-- cj-doc kind="api-member" level="6" id="std.core.func.print.print-t-t-bool-where-t-tostring" parent="std.core.func.print" -->
# print<T>(T, Bool) where T <: ToString

[← print](index.md)

## 签名

```cangjie role=signature
public func print<T>(arg: T, flush!: Bool = false): Unit where T <: ToString
```

向控制台输出 `T` 类型实例的字符串表示。

## 契约

参数：

- arg: T - 待输出的数据，支持实现了 ToString 接口的类型。
- flush!: Bool - 是否清空缓存，true 清空，false 不清空，默认 false。
