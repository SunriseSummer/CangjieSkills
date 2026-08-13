<!-- cj-doc kind="api-member" level="6" id="std.database.sql.enum.transactionaccessmode.operator-ne" parent="std.database.sql.enum.transactionaccessmode" -->
# TransactionAccessMode.!=

[← TransactionAccessMode](index.md)

## 签名

```cangjie role=signature
public operator func != (rhs: TransactionAccessMode): Bool
```

判断两个 TransactionAccessMode 是否不相等。

## 契约

参数：

- rhs: TransactionAccessMode - 传入 TransactionAccessMode 的枚举值。

返回值：

- Bool - 如果不相等，则返回 `true`，否则返回 `false`。
