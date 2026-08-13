<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.driver.prop-preferredpooling" parent="std.database.sql.interface.driver" -->
# Driver.preferredPooling

[← Driver](index.md)

## 签名

```cangjie role=signature
prop preferredPooling: Bool
```

指示驱动程序是否与连接池亲和。

## 契约

当该属性为 `false` 时，不建议使用连接池进行管理。例如，对于某些数据库驱动（如 SQLite），连接池化的收益不明显，因此不建议使用连接池。

类型：Bool
