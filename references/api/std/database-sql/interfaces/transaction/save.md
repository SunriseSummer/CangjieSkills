<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.transaction.save" parent="std.database.sql.interface.transaction" -->
# Transaction.save

[← Transaction](index.md)

## 签名

```cangjie role=signature
func save(savePointName: String): Unit
```

在事务中创建一个指定名称的保存点，可用于回滚此保存点之后的事务。

## 契约

参数：

- savePointName: String - 保存点名称。

异常：

- SqlException - 当提交事务时服务器端发生错误，以及当事务已提交或回滚或连接已断开时，抛出异常。
