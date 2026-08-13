<!-- cj-doc kind="api-type" level="5" id="std.database.sql.interface.updateresult" parent="std.database.sql" -->
# UpdateResult

[← std.database.sql](../../index.md)

`UpdateResult`

执行 Insert、Update、Delete 语句产生的结果接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`lastInsertId: Int64`](prop-lastinsertid.md) | 执行 Insert 语句自动生成的最后 row ID ，如果不支持则 row ID 为 0。 |
| [`rowCount: Int64`](prop-rowcount.md) | 执行 Insert、Update、Delete 语句影响的行数。 |
