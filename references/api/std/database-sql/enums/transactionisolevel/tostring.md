<!-- cj-doc kind="api-member" level="6" id="std.database.sql.enum.transactionisolevel.tostring" parent="std.database.sql.enum.transactionisolevel" -->
# TransactionIsoLevel.toString

[← TransactionIsoLevel](index.md)

## 签名

```cangjie role=signature
public func toString(): String
```

返回事务隔离级别的字符串表示。

## 契约

功能：返回事务隔离级别的字符串表示。枚举值和字符串的对应关系如下表所示：

| 枚举值          | 字符串             |
| --------------- | ------------------ |
| Chaos           | "Chaos"            |
| Linearizable    | "Linearizable"     |
| ReadCommitted   | "Read Committed"   |
| ReadUncommitted | "Read Uncommitted" |
| RepeatableRead  | "Repeatable Read"  |
| Serializable    | "Serializable"     |
| Snapshot        | "Snapshot"         |
| Unspecified     | "Unspecified"      |

返回值：

- String - 事务隔离级别的字符串。
