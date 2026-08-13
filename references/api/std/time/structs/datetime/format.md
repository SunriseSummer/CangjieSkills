<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.format" parent="std.time.struct.datetime" -->
# DateTime.format

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func format(fmt: String): String
```

返回一个表示 DateTime 实例的字符串，其格式由参数 `fmt` 指定。

## 契约

功能：返回一个表示 DateTime 实例的字符串，其格式由参数 `fmt` 指定。格式说明详见时间字符串格式。

参数：

- fmt: String - 返回字符串的格式，其格式可为 "yyyy/MM/dd HH:mm:ss OOOO"。

返回值：

- String - DateTime 实例在 `fmt` 指定格式下的字符串，如果无法解析则原样返回 `fmt` 指定格式。

异常：

- IllegalArgumentException - 当 `fmt` 格式不符合时间字符串格式，则抛出异常。
