<!-- cj-doc kind="api-type" level="5" id="std.database.sql.interface.connection" parent="std.database.sql" -->
# Connection

[← std.database.sql](../../index.md)

`Connection <: Resource`

数据库连接接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`state: ConnectionState`](prop-state.md) | 描述与数据源连接的当前状态。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`createTransaction(): Transaction`](createtransaction.md) | 创建事务对象。 |
| [`getMetaData(): Map<String, String>`](getmetadata.md) | 返回连接到的数据源元数据。 |
| [`prepareStatement(sql: String): Statement`](preparestatement.md) | 通过传入的 sql 语句，返回一个预执行的 Statement 对象实例。 |
