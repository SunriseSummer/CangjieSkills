<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.updateresult.prop-lastinsertid" parent="std.database.sql.interface.updateresult" -->
# UpdateResult.lastInsertId

[← UpdateResult](index.md)

## 签名

```cangjie role=signature
prop lastInsertId: Int64
```

执行 Insert 语句自动生成的最后 row ID ，如果不支持则 row ID 为 0。

## 契约

类型：Int64
