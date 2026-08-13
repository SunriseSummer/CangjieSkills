<!-- cj-doc kind="api-member" level="6" id="std.core.class.stringbuilder.reserve" parent="std.core.class.stringbuilder" -->
# StringBuilder.reserve

[← StringBuilder](index.md)

## 签名

```cangjie role=signature
public func reserve(additional: Int64): Unit
```

将 StringBuilder 扩容 `additional` 大小。

## 契约

当 `additional` 小于等于零，或剩余容量大于等于 `additional` 时，不发生扩容；当剩余容量小于 `additional` 时，扩容至当前容量的 1.5 倍（向下取整）与 `size` + `additional` 的最大值。

参数：

- additional: Int64 - 指定 StringBuilder 的扩容大小。
