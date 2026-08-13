<!-- cj-doc kind="api-member" level="6" id="std.time.class.timezone.loadfromtzdata" parent="std.time.class.timezone" -->
# TimeZone.loadFromTZData

[← TimeZone](index.md)

## 签名

```cangjie role=signature
public static func loadFromTZData(id: String, data: Array<UInt8>): TimeZone
```

使用指定的时区 ID 和时区数据构造一个自定义 TimeZone 实例。

## 契约

功能：使用指定的时区 ID 和时区数据构造一个自定义 TimeZone 实例。`id` 可以是任何合法字符串，`data` 需要满足 IANA 时区文件格式，加载成功时获得 TimeZone 实例，否则抛出异常。

参数：

- id: String - 时区 ID。
- data: Array\<UInt8> - 满足时区信息格式的数据。

返回值：

- TimeZone - 加载的时区。

异常：

- IllegalArgumentException - 当 `id` 为空时，抛出异常。
- InvalidDataException - 如果 `data` 解析失败，则抛出异常。
