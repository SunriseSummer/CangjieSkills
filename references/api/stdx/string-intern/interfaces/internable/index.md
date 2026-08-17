<!-- cj-doc kind="api-type" level="5" id="stdx.string_intern.interface.internable" parent="stdx.string_intern" -->
# Internable

[← stdx.string_intern](../../index.md)

`interface Internable`

用来为 String 类型提供池化缓存扩展。

## 方法

| 签名 | 功能 |
|---|---|
| [`static func configInternPool(capacity!: Int64, strMaxLength!: Int64): Unit`](configinternpool.md) | 配置字符串缓存池的容量和所缓存的字符串的最大长度，如果不配置，调用 intern 方法时仅返回常量池的字符串对象，而不会缓存新的字符串对象。 |
| [`static func intern(array: Array<Byte>): String（2 个重载）`](intern.md) | 获取与输入数组内容一致的已经被缓存起来的字符串对象。 |

## 扩展实现

| 签名 | 功能 |
|---|---|
| [`extend String <: Internable`](extensions/extend-string-internable.md) | 为 String 扩展 Internable 接口，以实现将 String 池化缓存。 |

