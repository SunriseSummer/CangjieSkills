<!-- cj-doc kind="api-member" level="6" id="std.core.func.println.println-t-t-where-t-tostring" parent="std.core.func.println" -->
# println<T>(T) where T <: ToString

[← println](index.md)

## 签名

```cangjie role=signature
public func println<T>(arg: T): Unit where T <: ToString
```

向控制台输出 `T` 类型实例的字符串表示，末尾添加换行。

## 契约

参数：

- arg: T - 待输出的数据，支持实现了 ToString 接口的类型。
