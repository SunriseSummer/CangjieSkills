<!-- cj-doc kind="api-member" level="6" id="std.time.class.timezone.init" parent="std.time.class.timezone" -->
# TimeZone.init

[← TimeZone](index.md)

## 签名

```cangjie role=signature
public init(id: String, offset: Duration)
```

使用指定的时区 ID 和偏移量构造一个自定义 TimeZone 实例。

## 契约

参数：

- id: String - 时区 ID。使用“/”作为分隔符，例如“Asia/Shanghai”，各操作系统使用相同规范。
- offset: Duration - 相对 UTC 时区的偏移量，精度为秒，向东为正、向西为负。取值范围为 (-25 * Duration.hour, 26 * Duration.hour)。

异常：

- IllegalArgumentException - 当输入 `id` 为空字符串，或 `offset` 超出有效区间时，抛出异常。
