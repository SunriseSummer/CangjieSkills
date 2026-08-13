<!-- cj-doc kind="api-type" level="5" id="std.database.sql.interface.statement" parent="std.database.sql" -->
# Statement

[← std.database.sql](../../index.md)

`Statement <: Resource`

sql 语句预执行接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`parameterColumnInfos: Array<ColumnInfo>`](prop-parametercolumninfos.md) | 预执行 sql 语句中，占位参数的列信息，比如列名，列类型，列长度，是否允许数据库 `Null` 值等。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`query(): QueryResult`](query.md) | 执行 sql 语句，得到查询结果。 |
| [`set<T>(index: Int64, value: T): Unit`](set.md) | 设置 sql 参数，将仓颉的数据类型转成数据库的数据类型。 |
| [`setNull(index: Int64): Unit`](setnull.md) | 将指定位置处的语句参数设置为 SQL NULL。 |
| [`setOption(key: String, value: String): Unit`](setoption.md) | 设置预执行 sql 语句选项。 |
| [`update(): UpdateResult`](update.md) | 执行 sql 语句，得到更新结果。 |
