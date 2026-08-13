<!-- cj-doc kind="api-type" level="5" id="std.database.sql.class.pooleddatasource" parent="std.database.sql" -->
# PooledDatasource

[← std.database.sql](../../index.md)

`PooledDatasource <: Datasource`

数据库连接池类，提供数据库连接池能力。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut connectionTimeout: Duration`](prop-connectiontimeout.md) | 从池中获取连接的超时时间。 |
| [`mut idleTimeout: Duration`](prop-idletimeout.md) | 允许连接在池中闲置的最长时间，超过这个时间的空闲连接可能会被回收。 |
| [`mut keepaliveTime: Duration`](prop-keepalivetime.md) | 检查空闲连接健康状况的间隔时间，防止它被数据库或网络基础设施超时。 |
| [`mut maxIdleSize: Int32`](prop-maxidlesize.md) | 最大空闲连接数量，超过这个数量的空闲连接会被关闭，负数或 0 表示无限制。 |
| [`mut maxLifeTime: Duration`](prop-maxlifetime.md) | 自连接创建以来的最大持续时间，在该持续时间之后，连接将自动关闭。 |
| [`mut maxSize: Int32`](prop-maxsize.md) | 连接池最大连接数量，负数或 0 表示无限制。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(datasource: Datasource)`](init.md) | 通过数据源 datasource 构造一个 PooledDatasource 实例，入参必须为 Datasource 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 关闭连接池中的所有连接并阻止其他连接请求。 |
| [`connect(): Connection`](connect.md) | 获取一个连接。 |
| [`isClosed(): Bool`](isclosed.md) | 判断连接是否关闭。 |
| [`setOption(key: String, value: String): Unit`](setoption.md) | 设置数据库驱动连接选项（公钥在 SqlOption 中预定义）。 |
