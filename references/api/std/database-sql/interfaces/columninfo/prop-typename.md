<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.columninfo.prop-typename" parent="std.database.sql.interface.columninfo" -->
# ColumnInfo.typeName

[← ColumnInfo](index.md)

## 签名

```cangjie role=signature
prop typeName: String
```

获取列类型名称，如果在仓颉中有对应数据类型的定义，返回对应类型的 `toString` 函数的返回值；如果在仓颉中无对应数据类型的定义，由数据库驱动定义。

## 契约

类型：String
