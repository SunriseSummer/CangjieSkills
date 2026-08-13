<!-- cj-doc kind="api-type" level="5" id="std.database.sql.interface.columninfo" parent="std.database.sql" -->
# ColumnInfo

[← std.database.sql](../../index.md)

`ColumnInfo`

执行 Select/Query 语句返回结果的列信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`displaySize: Int64`](prop-displaysize.md) | 获取列值的最大显示长度，如果无限制，则应该返回 Int64.Max （仍然受数据库的限制）。 |
| [`length: Int64`](prop-length.md) | 获取列值大小。 |
| [`name: String`](prop-name.md) | 列名或者别名。 |
| [`nullable: Bool`](prop-nullable.md) | 表示列值是否允许数据库 `Null` 值。 |
| [`scale: Int64`](prop-scale.md) | 获取列值的小数长度，如果无小数部分，返回 0。 |
| [`typeName: String`](prop-typename.md) | 获取列类型名称，如果在仓颉中有对应数据类型的定义，返回对应类型的 `toString` 函数的返回值；如果在仓颉中无对应数据类型的定义，由数据库驱动定义。 |
