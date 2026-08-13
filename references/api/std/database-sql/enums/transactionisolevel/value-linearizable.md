<!-- cj-doc kind="api-member" level="6" id="std.database.sql.enum.transactionisolevel.value-linearizable" parent="std.database.sql.enum.transactionisolevel" -->
# TransactionIsoLevel.Linearizable

[← TransactionIsoLevel](index.md)

## 签名

```cangjie role=signature
Linearizable
```

表示事务线性化。

## 契约

> **说明：**
>
> 区别于串行化（Serializable），线性化主要强调单个对象上（即 db 行或 nosql 记录）的一组单个操作（比如一系列读写操作），线性化保证这些操作严格按真实时间顺序执行。比如当您查看单个对象上的操作子集时，线性化是相关的。
