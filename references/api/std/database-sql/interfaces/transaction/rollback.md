<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.transaction.rollback" parent="std.database.sql.interface.transaction" -->
# Transaction.rollback

[← Transaction](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func rollback()

### 签名

```cangjie role=signature
func rollback(): Unit
```

从挂起状态回滚事务。

### 契约

异常：

- SqlException - 当提交事务时服务器端发生错误，以及当事务已提交或回滚或连接已断开时，抛出异常。

## func rollback(String)

### 签名

```cangjie role=signature
func rollback(savePointName: String): Unit
```

回滚事务至指定保存点名称。

### 契约

参数：

- savePointName: String - 保存点名称。

异常：

- SqlException - 当提交事务时服务器端发生错误，以及当事务已提交或回滚或连接已断开时，抛出异常。
