<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.now" parent="std.time.struct.datetime" -->
# DateTime.now

[← DateTime](index.md)

## 签名

```cangjie role=signature
public static func now(timeZone!: TimeZone = TimeZone.Local): DateTime
```

获取参数 `timeZone` 指定时区的当前时间。

## 契约

功能：获取参数 `timeZone` 指定时区的当前时间。该方法获取的当前时间受系统时间影响，如存在使用不受系统时间影响的计时场景，可使用 MonoTime.now() 替代。

参数：

- timeZone!: TimeZone - 时区，默认为本地时区。

返回值：

- DateTime - 返回指定时区当前时间。
