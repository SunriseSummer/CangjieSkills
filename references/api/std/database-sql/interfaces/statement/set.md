<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.statement.set" parent="std.database.sql.interface.statement" -->
# Statement.set

[← Statement](index.md)

## 签名

```cangjie role=signature
func set<T>(index: Int64, value: T): Unit
```

设置 sql 参数，将仓颉的数据类型转成数据库的数据类型。

## 契约

参数：

- index: Int64 - 参数所在序列。
- value: T - 参数值。
