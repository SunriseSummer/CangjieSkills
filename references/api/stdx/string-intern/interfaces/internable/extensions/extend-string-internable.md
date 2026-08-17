<!-- cj-doc kind="api-extension" level="6" id="stdx.string_intern.interface.internable.extension.extend-string-internable" parent="stdx.string_intern.interface.internable" -->
# extend String <: Internable

[← Internable](../index.md)

`extend String <: Internable`

为 String 扩展 Internable 接口，以实现将 String 池化缓存。

## 父类型

- Internable

配置字符串缓存池的容量和所缓存的字符串的最大长度，如果不配置，调用 intern 方法时仅返回常量池的字符串对象，而不会缓存新的字符串对象。

## 参数

- capacity!: Int64 - 动态缓存池的容量。默认值为 8192。
- strMaxLength!: Int64 - 动态缓存池中，每个字符串对象的最大长度，超出后不会缓存。默认值为 512。

## 异常

- IllegalArgumentException - 当 `capacity` 或 `strMaxLength` 参数的值小于等于 0 时，抛出异常。

## 成员

| 签名 | 功能 |
|---|---|
| `static func configInternPool(capacity!: Int64 = 8192, strMaxLength!: Int64 = 512): Unit` | 配置字符串缓存池的容量和所缓存的字符串的最大长度，如果不配置，调用 intern 方法时仅返回常量池的字符串对象，而不会缓存新的字符串对象。 |
| `static func intern(array: Array<Byte>): String` | 获取与输入数组内容一致的已经被缓存起来的字符串对象。 |
| `static func intern(str: String): String` | 获取与输入字符串内容一致的已经被缓存起来的字符串对象。 |

