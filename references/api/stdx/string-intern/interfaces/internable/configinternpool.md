<!-- cj-doc kind="api-member" level="6" id="stdx.string_intern.interface.internable.configinternpool" parent="stdx.string_intern.interface.internable" -->
# Internable.configInternPool

[← Internable](index.md)

## 签名

```cangjie role=signature
static func configInternPool(capacity!: Int64, strMaxLength!: Int64): Unit
```

配置字符串缓存池的容量和所缓存的字符串的最大长度，如果不配置，调用 intern 方法时仅返回常量池的字符串对象，而不会缓存新的字符串对象。

## 参数

- capacity!: Int64 - 动态缓存池的容量。
- strMaxLength!: Int64 - 动态缓存池中，每个字符串对象的最大长度，超出后不会缓存。

## 异常

- IllegalArgumentException - 当 `capacity` 或 `strMaxLength` 参数的值小于等于 0 时，抛出异常。

