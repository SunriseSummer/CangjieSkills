<!-- cj-doc kind="api-type" level="5" id="std.database.sql.class.drivermanager" parent="std.database.sql" -->
# DriverManager

[← std.database.sql](../../index.md)

`DriverManager`

支持运行时根据驱动名获取数据库驱动实例。

## 方法

| 签名 | 功能 |
|---|---|
| [`static deregister(driverName: String): Unit`](deregister.md) | 按名称取消注册数据库驱动（如果存在）。 |
| [`static drivers(): Array<String>`](drivers.md) | 返回已注册数据库驱动名称的列表（名称已按照字典序排序）。 |
| [`static getDriver(driverName: String): Option<Driver>`](getdriver.md) | 按名称获取已注册的数据库驱动，如果不存在返回 `None`。 |
| [`static register(driverName: String, driver: Driver): Unit`](register.md) | 按名称和驱动实例注册数据库驱动，名称和实例一一对应。 |
