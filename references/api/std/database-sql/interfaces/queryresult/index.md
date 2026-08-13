<!-- cj-doc kind="api-type" level="5" id="std.database.sql.interface.queryresult" parent="std.database.sql" -->
# QueryResult

[← std.database.sql](../../index.md)

`QueryResult <: Resource`

执行 Select 语句产生的结果接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`columnInfos: Array<ColumnInfo>`](prop-columninfos.md) | 返回结果集的列信息，比如列名，列类型，列长度，是否允许数据库 Null 值等。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`get<T>(index: Int64): T`](get.md) | 从结果集的当前行检索指定列的值。 |
| [`getOrNull<T>(index: Int64): ?T`](getornull.md) | 从结果集的当前行检索指定列的值，数据库列允许 SQL NULL。 |
| [`next(): Bool`](next.md) | 向后移动一行，必须先调用一次 `next()` 才能移动到第一行，第二次调用移动到第二行，依此类推。 |
