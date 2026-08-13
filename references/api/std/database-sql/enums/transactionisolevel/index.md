<!-- cj-doc kind="api-type" level="5" id="std.database.sql.enum.transactionisolevel" parent="std.database.sql" -->
# TransactionIsoLevel

[← std.database.sql](../../index.md)

`TransactionIsoLevel <: ToString & Hashable & Equatable<TransactionIsoLevel>`

事务隔离级别。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Chaos`](value-chaos.md) | 表示无法覆盖来自隔离级别更高的事务的挂起更改。 |
| [`Linearizable`](value-linearizable.md) | 表示事务线性化。 |
| [`ReadCommitted`](value-readcommitted.md) | 表示事务等待，直到其他事务写锁定的行被解锁；这将防止它读取任何“脏”数据。 |
| [`ReadUncommitted`](value-readuncommitted.md) | 表示事务之间不隔离。 |
| [`RepeatableRead`](value-repeatableread.md) | 表示事务可重复读。 |
| [`Serializable`](value-serializable.md) | 表示事务可串行化。 |
| [`Snapshot`](value-snapshot.md) | 表示快照隔离通过使用行版本控制避免了大多数锁定和阻止。 |
| [`Unspecified`](value-unspecified.md) | 未指定的事务隔离级别，其行为取决于具体的数据库服务器。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](hashcode.md) | 获取事务隔离级别的哈希值。 |
| [`toString(): String`](tostring.md) | 返回事务隔离级别的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator != (rhs: TransactionIsoLevel): Bool`](operator-ne.md) | 判断两个 TransactionIsoLevel 是否不相等。 |
| [`operator == (rhs: TransactionIsoLevel): Bool`](operator-eq.md) | 判断两个 TransactionIsoLevel 是否相等。 |
