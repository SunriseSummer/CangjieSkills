<!-- cj-doc kind="api-member" level="6" id="std.time.class.timezone.loadfrompaths" parent="std.time.class.timezone" -->
# TimeZone.loadFromPaths

[← TimeZone](index.md)

## 签名

```cangjie role=signature
public static func loadFromPaths(id: String, tzpaths: Array<String>): TimeZone
```

根据参数 `tzpaths` 指定的时区文件目录，加载参数 `id` 指定的时区。

## 契约

加载时区时，将从第一个被读取成功的时区文件路径中加载时区。时区文件格式需要满足时区信息格式。

参数：

- id: String - 时区 ID。
- tzpaths: Array\<String> - 时区文件路径数组。

返回值：

- TimeZone - 加载的时区。

异常：

- IllegalArgumentException - 当 `id` 为空，或长度超过 4096 字节，或不符合标准时区 ID 格式时，抛出异常。
- InvalidDataException - 当时区文件加载失败（找不到文件，文件解析失败等）时，抛出异常。
