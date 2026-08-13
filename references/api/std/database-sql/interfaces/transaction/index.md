<!-- cj-doc kind="api-type" level="5" id="std.database.sql.interface.transaction" parent="std.database.sql" -->
# Transaction

[← std.database.sql](../../index.md)

`Transaction`

定义数据库事务的核心行为。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut accessMode: TransactionAccessMode`](prop-accessmode.md) | 获取数据库事务访问模式。 |
| [`mut deferrableMode: TransactionDeferrableMode`](prop-deferrablemode.md) | 获取数据库事务延迟模式。 |
| [`mut isoLevel: TransactionIsoLevel`](prop-isolevel.md) | 获取数据库事务隔离级别。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`begin(): Unit`](begin.md) | 开始数据库事务。 |
| [`commit(): Unit`](commit.md) | 提交数据库事务。 |
| [`release(savePointName: String): Unit`](release.md) | 销毁先前在当前事务中定义的保存点。 |
| [`rollback(): Unit`](rollback.md) | 从挂起状态回滚事务。 |
| [`rollback(savePointName: String): Unit`](rollback.md) | 回滚事务至指定保存点名称。 |
| [`save(savePointName: String): Unit`](save.md) | 在事务中创建一个指定名称的保存点，可用于回滚此保存点之后的事务。 |
