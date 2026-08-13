<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.statement.setoption" parent="std.database.sql.interface.statement" -->
# Statement.setOption

[← Statement](index.md)

## 签名

```cangjie role=signature
func setOption(key: String, value: String): Unit
```

设置预执行 sql 语句选项。

## 契约

参数：

- key: String - 连接选项名称。
- value: String - 连接选项的值。
