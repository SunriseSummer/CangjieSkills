<!-- cj-doc kind="api-package" level="4" id="std.database.sql" parent="api.std" -->
# std.database.sql

[← std 包索引](../index.md)

提供仓颉访问数据库的接口。

包路径：`std.database.sql`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`DriverManager`](classes/drivermanager/index.md) | 支持运行时根据驱动名获取数据库驱动实例。 |
| [`PooledDatasource <: Datasource`](classes/pooleddatasource/index.md) | 数据库连接池类，提供数据库连接池能力。 |
| [`SqlOption`](classes/sqloption/index.md) | 预定义的 sql 选项名称和值。 |
| [`open SqlException <: Exception`](classes/sqlexception/index.md) | 用于处理 sql 相关的异常。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`ColumnInfo`](interfaces/columninfo/index.md) | 执行 Select/Query 语句返回结果的列信息。 |
| [`Connection <: Resource`](interfaces/connection/index.md) | 数据库连接接口。 |
| [`Datasource <: Resource`](interfaces/datasource/index.md) | 数据源接口。 |
| [`Driver`](interfaces/driver/index.md) | 数据库驱动接口。 |
| [`QueryResult <: Resource`](interfaces/queryresult/index.md) | 执行 Select 语句产生的结果接口。 |
| [`Statement <: Resource`](interfaces/statement/index.md) | sql 语句预执行接口。 |
| [`Transaction`](interfaces/transaction/index.md) | 定义数据库事务的核心行为。 |
| [`UpdateResult`](interfaces/updateresult/index.md) | 执行 Insert、Update、Delete 语句产生的结果接口。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`ConnectionState <: Equatable<ConnectionState>`](enums/connectionstate/index.md) | 描述与数据源连接的当前状态。 |
| [`TransactionAccessMode <: ToString & Hashable & Equatable<TransactionAccessMode>`](enums/transactionaccessmode/index.md) | 事务读写模式。 |
| [`TransactionDeferrableMode <: ToString & Hashable & Equatable<TransactionDeferrableMode>`](enums/transactiondeferrablemode/index.md) | 事务的延迟模式。 |
| [`TransactionIsoLevel <: ToString & Hashable & Equatable<TransactionIsoLevel>`](enums/transactionisolevel/index.md) | 事务隔离级别。 |
