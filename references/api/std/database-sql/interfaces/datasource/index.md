<!-- cj-doc kind="api-type" level="5" id="std.database.sql.interface.datasource" parent="std.database.sql" -->
# Datasource

[← std.database.sql](../../index.md)

`Datasource <: Resource`

数据源接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`connect(): Connection`](connect.md) | 返回一个可用的连接。 |
| [`setOption(key: String, value: String): Unit`](setoption.md) | 设置连接选项。 |
