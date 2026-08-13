<!-- cj-doc kind="api-member" level="6" id="std.core.class.stringbuilder.reset" parent="std.core.class.stringbuilder" -->
# StringBuilder.reset

[← StringBuilder](index.md)

## 签名

```cangjie role=signature
public func reset(capacity!: Option<Int64> = None): Unit
```

清空当前 StringBuilder，并将容量重置为 `capacity` 指定的值。

## 契约

参数：

- capacity!: Option\<Int64> - 重置后 StringBuilder 实例的容量大小，取值范围为 `None` 和 (`Some(0)`, `Some(Int64.Max)`]，默认值 `None` 表示采用默认大小容量（32）。

异常：

- IllegalArgumentException - 当参数 `capacity` 的值小于等于 0 时，抛出异常。
