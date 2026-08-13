<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.drivermanager.deregister" parent="std.database.sql.class.drivermanager" -->
# DriverManager.deregister

[← DriverManager](index.md)

## 签名

```cangjie role=signature
public static func deregister(driverName: String): Unit
```

按名称取消注册数据库驱动（如果存在）。

## 契约

功能：按名称取消注册数据库驱动（如果存在）。本函数并发安全。

参数：

- driverName: String - 驱动名称。
