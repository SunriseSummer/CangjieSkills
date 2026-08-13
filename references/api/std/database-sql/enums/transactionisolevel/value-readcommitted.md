<!-- cj-doc kind="api-member" level="6" id="std.database.sql.enum.transactionisolevel.value-readcommitted" parent="std.database.sql.enum.transactionisolevel" -->
# TransactionIsoLevel.ReadCommitted

[← TransactionIsoLevel](index.md)

## 签名

```cangjie role=signature
ReadCommitted
```

表示事务等待，直到其他事务写锁定的行被解锁；这将防止它读取任何“脏”数据。
