<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.queryresult.get" parent="std.database.sql.interface.queryresult" -->
# QueryResult.get

[← QueryResult](index.md)

## 签名

```cangjie role=signature
func get<T>(index: Int64): T
```

从结果集的当前行检索指定列的值。

## 契约

参数：

- index: Int64 - 指定列。

返回值：

- T - `T` 类型的实例。
