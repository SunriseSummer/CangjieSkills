<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.drivermanager.getdriver" parent="std.database.sql.class.drivermanager" -->
# DriverManager.getDriver

[← DriverManager](index.md)

## 签名

```cangjie role=signature
public static func getDriver(driverName: String): Option<Driver>
```

按名称获取已注册的数据库驱动，如果不存在返回 `None`。

## 契约

功能：按名称获取已注册的数据库驱动，如果不存在返回 `None`。本函数并发安全。

参数：

- driverName: String - 驱动名称。

返回值：

- Option\<Driver> - 若驱动存在则返回 Option 包装的驱动实例，否则返回 `None`。
