<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.pooleddatasource.setoption" parent="std.database.sql.class.pooleddatasource" -->
# PooledDatasource.setOption

[← PooledDatasource](index.md)

## 签名

```cangjie role=signature
public func setOption(key: String, value: String): Unit
```

设置数据库驱动连接选项（公钥在 SqlOption 中预定义）。

## 契约

参数：

- key: String - 连接选项名称。
- value: String - 连接选项的值。
