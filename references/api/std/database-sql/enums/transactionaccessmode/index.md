<!-- cj-doc kind="api-type" level="5" id="std.database.sql.enum.transactionaccessmode" parent="std.database.sql" -->
# TransactionAccessMode

[← std.database.sql](../../index.md)

`TransactionAccessMode <: ToString & Hashable & Equatable<TransactionAccessMode>`

事务读写模式。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`ReadOnly`](value-readonly.md) | 表示只读模式。 |
| [`ReadWrite`](value-readwrite.md) | 表示读 + 写模式。 |
| [`Unspecified`](value-unspecified.md) | 表示未指定的事务读写模式。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](hashcode.md) | 获取事务读写模式的哈希值。 |
| [`toString(): String`](tostring.md) | 返回事务读写模式的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator != (rhs: TransactionAccessMode): Bool`](operator-ne.md) | 判断两个 TransactionAccessMode 是否不相等。 |
| [`operator == (rhs: TransactionAccessMode): Bool`](operator-eq.md) | 判断两个 TransactionAccessMode 是否相等。 |
