<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.nowutc" parent="std.time.struct.datetime" -->
# DateTime.nowUTC

[← DateTime](index.md)

## 签名

```cangjie role=signature
public static func nowUTC(): DateTime
```

获取 UTC 时区的当前时间。

## 契约

功能：获取 UTC 时区的当前时间。该方法获取的当前时间受系统时间影响，如存在使用不受系统时间影响的计时场景，可使用 MonoTime.now() 替代。

返回值：

- DateTime - UTC 时区当前时间。
