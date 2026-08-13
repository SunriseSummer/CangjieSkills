<!-- cj-doc kind="api-member" level="6" id="std.database.sql.enum.transactionisolevel.operator-ne" parent="std.database.sql.enum.transactionisolevel" -->
# TransactionIsoLevel.!=

[← TransactionIsoLevel](index.md)

## 签名

```cangjie role=signature
public operator func != (rhs: TransactionIsoLevel): Bool
```

判断两个 TransactionIsoLevel 是否不相等。

## 契约

参数：

- rhs: TransactionIsoLevel - 传入的 TransactionIsoLevel。

返回值：

- Bool - 如果不相等，则返回 `true`，否则返回 `false`。
