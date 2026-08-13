<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.drivermanager.register" parent="std.database.sql.class.drivermanager" -->
# DriverManager.register

[← DriverManager](index.md)

## 签名

```cangjie role=signature
public static func register(driverName: String, driver: Driver): Unit
```

按名称和驱动实例注册数据库驱动，名称和实例一一对应。

## 契约

功能：按名称和驱动实例注册数据库驱动，名称和实例一一对应。本方法并发安全。

参数：

- driverName: String - 驱动名称。
- driver: Driver - 驱动实例。

异常：

- SqlException - 当指定的驱动名称已经存在时，抛出异常。
