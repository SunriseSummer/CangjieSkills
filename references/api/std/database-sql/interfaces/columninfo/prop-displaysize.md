<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.columninfo.prop-displaysize" parent="std.database.sql.interface.columninfo" -->
# ColumnInfo.displaySize

[← ColumnInfo](index.md)

## 签名

```cangjie role=signature
prop displaySize: Int64
```

获取列值的最大显示长度，如果无限制，则应该返回 Int64.Max （仍然受数据库的限制）。

## 契约

类型：Int64
