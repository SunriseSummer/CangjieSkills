<!-- cj-doc kind="api-type" level="5" id="std.database.sql.interface.driver" parent="std.database.sql" -->
# Driver

[← std.database.sql](../../index.md)

`Driver`

数据库驱动接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`name: String`](prop-name.md) | 驱动名称。 |
| [`preferredPooling: Bool`](prop-preferredpooling.md) | 指示驱动程序是否与连接池亲和。 |
| [`version: String`](prop-version.md) | 驱动版本。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`open(connectionString: String, opts: Array<(String, String)>): Datasource`](open.md) | 通过 `connectionString` 和选项打开数据源。 |
