<!-- cj-doc kind="api-member" level="6" id="std.database.sql.enum.transactiondeferrablemode.tostring" parent="std.database.sql.enum.transactiondeferrablemode" -->
# TransactionDeferrableMode.toString

[← TransactionDeferrableMode](index.md)

## 签名

```cangjie role=signature
public func toString(): String
```

返回事务延迟模式的字符串表示。

## 契约

功能：返回事务延迟模式的字符串表示。枚举值和字符串的对应关系如下表所示：

| 枚举值        | 字符串           |
| ------------- | ---------------- |
| Deferrable    | "Deferrable"     |
| NotDeferrable | "Not Deferrable" |
| Unspecified   | "Unspecified"    |

返回值：

- String - 事务延迟模式的字符串。
