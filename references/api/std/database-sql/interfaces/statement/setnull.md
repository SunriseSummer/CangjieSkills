<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.statement.setnull" parent="std.database.sql.interface.statement" -->
# Statement.setNull

[← Statement](index.md)

## 签名

```cangjie role=signature
func setNull(index: Int64): Unit
```

将指定位置处的语句参数设置为 SQL NULL。

## 契约

参数：

- index: Int64 - 参数所在序列。
