<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.pooleddatasource.close" parent="std.database.sql.class.pooleddatasource" -->
# PooledDatasource.close

[← PooledDatasource](index.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭连接池中的所有连接并阻止其他连接请求。

## 契约

功能：关闭连接池中的所有连接并阻止其他连接请求。调用该方法会阻塞至所有连接关闭并归还到连接池。
