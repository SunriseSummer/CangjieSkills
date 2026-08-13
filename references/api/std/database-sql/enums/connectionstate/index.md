<!-- cj-doc kind="api-type" level="5" id="std.database.sql.enum.connectionstate" parent="std.database.sql" -->
# ConnectionState

[← std.database.sql](../../index.md)

`ConnectionState <: Equatable<ConnectionState>`

描述与数据源连接的当前状态。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Broken`](value-broken.md) | 表示与数据源的连接已中断。 |
| [`Closed`](value-closed.md) | 表示连接对象已关闭。 |
| [`Connected`](value-connected.md) | 表示连接对象已与数据源连接上。 |
| [`Connecting`](value-connecting.md) | 表示连接对象正在与数据源连接。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(rhs: ConnectionState): Bool`](operator-ne.md) | 判断数据源连接状态是否不同。 |
| [`operator ==(rhs: ConnectionState): Bool`](operator-eq.md) | 判断数据源连接状态是否相同。 |
