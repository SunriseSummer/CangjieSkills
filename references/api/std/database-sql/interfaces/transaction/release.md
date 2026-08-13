<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.transaction.release" parent="std.database.sql.interface.transaction" -->
# Transaction.release

[← Transaction](index.md)

## 签名

```cangjie role=signature
func release(savePointName: String): Unit
```

销毁先前在当前事务中定义的保存点。

## 契约

功能：销毁先前在当前事务中定义的保存点。这允许系统在事务结束之前回收一些资源。

参数：

- savePointName: String - 保存点名称。

异常：

- SqlException - 当提交事务时服务器端发生错误，以及当事务已提交或回滚或连接已断开时，抛出异常。
