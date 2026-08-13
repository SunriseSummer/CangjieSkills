<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.driver.open" parent="std.database.sql.interface.driver" -->
# Driver.open

[← Driver](index.md)

## 签名

```cangjie role=signature
func open(connectionString: String, opts: Array<(String, String)>): Datasource
```

通过 `connectionString` 和选项打开数据源。

## 契约

参数：

- connectionString: String - 数据库连接字符串。
- opts: Array\<(String, String)> - key，value 的 tuple 数组，打开数据源的选项。

返回值：

- Datasource - 数据源实例。
