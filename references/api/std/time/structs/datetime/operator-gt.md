<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.operator-gt" parent="std.time.struct.datetime" -->
# DateTime.>

[← DateTime](index.md)

## 签名

```cangjie role=signature
public operator func >(r: DateTime): Bool
```

判断当前 DateTime 实例是否晚于 `r`（指向更晚的 UTC 时间的 DateTime 更大）。

## 契约

参数：

- r: DateTime - DateTime 实例。

返回值：

- Bool - `true` 或 `false`。当前 DateTime 实例晚于 `r` 时，返回 `true`；否则，返回 `false`。
