<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.connection.preparestatement" parent="std.database.sql.interface.connection" -->
# Connection.prepareStatement

[← Connection](index.md)

## 签名

```cangjie role=signature
func prepareStatement(sql: String): Statement
```

通过传入的 sql 语句，返回一个预执行的 Statement 对象实例。

## 契约

参数：

- sql: String - 预执行的 sql 语句，sql 语句的参数只支持 `?` 符号占位符。

返回值：

- Statement - 一个可以执行 sql 语句的实例对象。

异常：

- SqlException - 当 sql 语句包含不认识的字符时，抛出异常。
