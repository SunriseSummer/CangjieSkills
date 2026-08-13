<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.transaction.begin" parent="std.database.sql.interface.transaction" -->
# Transaction.begin

[← Transaction](index.md)

## 签名

```cangjie role=signature
func begin(): Unit
```

开始数据库事务。

## 契约

异常：

- SqlException - 当提交事务时服务器端发生错误，以及当事务已提交或回滚或连接已断开时，抛出异常。
