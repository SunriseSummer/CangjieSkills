<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.tostring" parent="std.time.struct.datetime" -->
# DateTime.toString

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func toString(): String
```

返回一个表示 DateTime 实例的字符串，其格式为 `RFC3339` 中 `date-time` 格式，如果时间包含纳秒信息（不为零），会打印出小数秒。

## 契约

返回值：

- String - DateTime 实例的字符串表示。
