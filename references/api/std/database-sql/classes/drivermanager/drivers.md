<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.drivermanager.drivers" parent="std.database.sql.class.drivermanager" -->
# DriverManager.drivers

[← DriverManager](index.md)

## 签名

```cangjie role=signature
public static func drivers(): Array<String>
```

返回已注册数据库驱动名称的列表（名称已按照字典序排序）。

## 契约

功能：返回已注册数据库驱动名称的列表（名称已按照字典序排序）。本方法并发安全。

返回值：

- Array\<String> - 数据库驱动名称的列表。
