<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.parse" parent="std.time.struct.datetime" -->
# DateTime.parse

[← DateTime](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func parse(String)

### 签名

```cangjie role=signature
public static func parse(str: String): DateTime
```

从参数 `str` 中解析得到时间，解析成功时返回 DateTime 实例。

### 契约

参数：

- str: String - 时间字符串，格式为 `RFC3339` 中 `date-time` 格式，可包含小数秒，如 "2023-04-10T08:00:00[.123456]+08:00"（`[]` 中的内容表示可选项）。

返回值：

- DateTime - 从参数 `str` 中解析出的 DateTime 实例。

异常：

- TimeParseException - 无法正常解析时，抛出异常。

## static func parse(String, String)

### 签名

```cangjie role=signature
public static func parse(str: String, format: String): DateTime
```

根据 `format` 指定的时间格式，从字符串 `str` 中解析得到时间，解析成功时返回 DateTime 实例。

### 契约

参数：

- str: String - 时间字符串，例如："2023/04/10 08:00:00 +08:00"。
- format: String - 时间字符串的格式，例如："yyyy/MM/dd HH:mm:ss OOOO"。格式说明详见时间字符串格式。

返回值：

- DateTime - 根据参数 `format` 指定的时间格式，从参数 `str` 中解析出的 DateTime 实例。

异常：

- TimeParseException - 当无法正常解析时，或存在同一 `format` 的多次取值时，抛出异常。
- IllegalArgumentException - 当 `format` 格式不正确时，抛出异常。

## 典型示例

无格式参数的重载按 RFC 3339 解析；数字月份从 `month.toInteger()` 取得。

```cangjie cjtest=run id=api.datetime.parse.run form=unit timeout=20s
package datetime_parse_example

import std.time.*

main(): Unit {
    let value = DateTime.parse("2024-03-08T14:30:00+08:00")
    println("${value.year}-${value.month.toInteger()}-${value.dayOfMonth}")
    println("${value.hour}:${value.minute}")
}
```

```text cjtest=expect for=api.datetime.parse.run stream=stdout match=exact
2024-3-8
14:30
```
