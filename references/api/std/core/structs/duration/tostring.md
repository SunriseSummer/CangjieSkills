<!-- cj-doc kind="api-member" level="6" id="std.core.struct.duration.tostring" parent="std.core.struct.duration" -->
# Duration.toString

[← Duration](index.md)

## 签名

```cangjie role=signature
public func toString(): String
```

获得当前 Duration 实例的字符串表示，格式形如："1d2h3m4s5ms6us7ns"，表示“1 天 2 小时 3 分钟 4 秒 5 毫秒 6 微秒 7 纳秒”。

## 契约

功能：获得当前 Duration 实例的字符串表示，格式形如："1d2h3m4s5ms6us7ns"，表示“1 天 2 小时 3 分钟 4 秒 5 毫秒 6 微秒 7 纳秒”。某个单位下数值为 0 时此项会被省略，特别地，当所有单位下数值都为 0 时，返回 "0s"。

返回值：

- String - 当前 Duration 实例的字符串表示。
