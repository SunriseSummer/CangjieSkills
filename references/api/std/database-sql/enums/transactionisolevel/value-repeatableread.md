<!-- cj-doc kind="api-member" level="6" id="std.database.sql.enum.transactionisolevel.value-repeatableread" parent="std.database.sql.enum.transactionisolevel" -->
# TransactionIsoLevel.RepeatableRead

[← TransactionIsoLevel](index.md)

## 签名

```cangjie role=signature
RepeatableRead
```

表示事务可重复读。

## 契约

功能：表示事务可重复读。对同一字段的多次读取结果都是一致的，除非数据是被本身事务自己所修改。
