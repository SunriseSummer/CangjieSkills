<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.connection.createtransaction" parent="std.database.sql.interface.connection" -->
# Connection.createTransaction

[← Connection](index.md)

## 签名

```cangjie role=signature
func createTransaction(): Transaction
```

创建事务对象。

## 契约

返回值：

- Transaction - 事务对象。

异常：

- SqlException - 当已经处于事务状态，不支持并行事务时，抛出异常。
