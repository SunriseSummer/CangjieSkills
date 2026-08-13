<!-- cj-doc kind="api-member" level="7" id="std.core.class.stringbuilder.append.append-7c0236b3e0" parent="std.core.class.stringbuilder.append" -->
# StringBuilder.func append<T>(T) where T <: ToString

[← StringBuilder.append](index.md)

## 签名

```cangjie role=signature
public func append<T>(v: T): Unit where T <: ToString
```

在 StringBuilder 末尾插入参数 `v` 指定 `T` 类型的字符串表示，类型 `T` 需要实现 ToString 接口。

## 契约

参数：

- v: T - 插入的 `T` 类型实例。
