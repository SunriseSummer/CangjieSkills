<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.statement.query" parent="std.database.sql.interface.statement" -->
# Statement.query

[← Statement](index.md)

## 签名

```cangjie role=signature
func query(): QueryResult
```

执行 sql 语句，得到查询结果。

## 契约

返回值：

- QueryResult - 查询结果。

异常：

- SqlException - 当执行过程中发生了异常情况，比如网络中断，服务器超时，参数个数不正确时，抛出异常。
