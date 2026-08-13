<!-- cj-doc kind="api-type" level="5" id="std.database.sql.class.sqlexception" parent="std.database.sql" -->
# SqlException

[← std.database.sql](../../index.md)

`open SqlException <: Exception`

用于处理 sql 相关的异常。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`errorCode: Int64`](prop-errorcode.md) | 数据库供应商返回的整数错误代码。 |
| [`override message: String`](prop-message.md) | 获取异常信息字符串。 |
| [`sqlState: String`](prop-sqlstate.md) | 长度为五个字符的字符串，是数据库系统返回的最后执行的 sql 语句状态。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 无参构造函数。 |
| [`init(message: String)`](init.md) | 根据异常信息创建 SqlException 实例。 |
| [`init(message: String, sqlState: String, errorCode: Int64)`](init.md) | 根据异常信息、SQL 语句状态、错误码信息，创建 SqlException 实例。 |
