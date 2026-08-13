<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.tryparse" parent="std.time.struct.datetime" -->
# DateTime.tryParse

[← DateTime](index.md)

## 签名

```cangjie role=signature
public static func tryParse(str: String): Option<DateTime>
```

从参数 `str` 中解析得到时间，解析成功时返回 Option<DateTime> 实例。

## 契约

参数：

- str: String - 时间字符串，格式为 `RFC3339` 中 `date-time` 格式，可包含小数秒，如 "2023-04-10T08:00:00[.123456]+08:00"（`[]` 中的内容表示可选项）。

返回值：

- Option\<DateTime> - 从参数 `str` 中解析出的 Option\<DateTime> 实例，如果解析失败返回 Option\<DateTime>.None。
