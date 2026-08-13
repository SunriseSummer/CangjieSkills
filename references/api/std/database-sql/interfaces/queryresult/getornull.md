<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.queryresult.getornull" parent="std.database.sql.interface.queryresult" -->
# QueryResult.getOrNull

[← QueryResult](index.md)

## 签名

```cangjie role=signature
func getOrNull<T>(index: Int64): ?T
```

从结果集的当前行检索指定列的值，数据库列允许 SQL NULL。

## 契约

参数：

- index: Int64 - 指定列。

返回值：

- ?T - `T` 类型的实例，如果为空，返回 None。

异常：

- SqlException - 索引超出列范围，或者行数据未准备好时，抛出异常。
