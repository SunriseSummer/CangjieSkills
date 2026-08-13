<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.pooleddatasource.prop-connectiontimeout" parent="std.database.sql.class.pooleddatasource" -->
# PooledDatasource.connectionTimeout

[← PooledDatasource](index.md)

## 签名

```cangjie role=signature
public mut prop connectionTimeout: Duration
```

从池中获取连接的超时时间。

## 契约

类型：Duration

异常：

- ArithmeticException - 当该属性被设置为 Duration.Max 或 Duration.Min 时，抛此异常。
- SqlException - 当获取连接超时后，抛出此异常。
