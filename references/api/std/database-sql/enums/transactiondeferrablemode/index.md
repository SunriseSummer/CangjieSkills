<!-- cj-doc kind="api-type" level="5" id="std.database.sql.enum.transactiondeferrablemode" parent="std.database.sql" -->
# TransactionDeferrableMode

[← std.database.sql](../../index.md)

`TransactionDeferrableMode <: ToString & Hashable & Equatable<TransactionDeferrableMode>`

事务的延迟模式。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Deferrable`](value-deferrable.md) | 表示可延迟。 |
| [`NotDeferrable`](value-notdeferrable.md) | 表示不可延迟。 |
| [`Unspecified`](value-unspecified.md) | 未指定的事务延迟模式，其行为取决于具体的数据库服务器。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](hashcode.md) | 获取事务延迟模式的哈希值。 |
| [`toString(): String`](tostring.md) | 返回事务延迟模式的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator != (rhs: TransactionDeferrableMode): Bool`](operator-ne.md) | 判断两个 TransactionDeferrableMode 是否不相等。 |
| [`operator == (rhs: TransactionDeferrableMode): Bool`](operator-eq.md) | 判断两个 TransactionDeferrableMode 是否相等。 |
