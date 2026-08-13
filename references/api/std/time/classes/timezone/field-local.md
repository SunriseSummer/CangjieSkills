<!-- cj-doc kind="api-member" level="6" id="std.time.class.timezone.field-local" parent="std.time.class.timezone" -->
# TimeZone.Local

[← TimeZone](index.md)

## 签名

```cangjie role=signature
public static let Local: TimeZone
```

获取本地时区。

## 契约

`Local` 从系统环境变量 TZ 中获取时区 ID，并根据该时区 ID 从系统时区文件中加载时区。其行为与函数 load 相同。

环境变量 TZ 的取值为标准时区 ID 格式（各操作系统遵循相同规范），例如“Asia/Shanghai”。

若环境变量 TZ 未设置或者为空，加载本地时区的规则如下：

- 在 Linux/Unix like 系统上：加载系统路径“/etc/localtime”链接，时区名与“/etc/localtime”指向的相对路径名相同，例如“Asia/Shanghai”。
- 如果上一条执行失败或者在 Windows 系统上，返回 ID 为 “UTC&偏移量” 的时区，例如“Asia/Shanghai”对应的时区为“UTC+08:00”。

类型：TimeZone
