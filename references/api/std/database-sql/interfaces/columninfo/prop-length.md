<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.columninfo.prop-length" parent="std.database.sql.interface.columninfo" -->
# ColumnInfo.length

[← ColumnInfo](index.md)

## 签名

```cangjie role=signature
prop length: Int64
```

获取列值大小。

## 契约

> **说明：**
>
> - 对于数值数据，表示最大精度。
> - 对于字符数据，表示以字符为单位的长度。
> - 对于日期时间数据类型，表示字符串表示形式的最大字符长度。
> - 对于二进制数据，表示以字节为单位的长度。
> - 对于 RowID 数据类型，表示以字节为单位的长度。
> - 对于列大小不适用的数据类型，返回 0。

类型：Int64
