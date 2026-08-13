<!-- cj-doc kind="api-member" level="6" id="std.database.sql.enum.transactionaccessmode.tostring" parent="std.database.sql.enum.transactionaccessmode" -->
# TransactionAccessMode.toString

[← TransactionAccessMode](index.md)

## 签名

```cangjie role=signature
public func toString(): String
```

返回事务读写模式的字符串表示。

## 契约

功能：返回事务读写模式的字符串表示。枚举值和字符串的对应关系如下表所示：

| 枚举值      | 字符串        |
| ----------- | ------------- |
| ReadOnly    | "Read Only"   |
| ReadWrite   | "Read Write"  |
| Unspecified | "Unspecified" |

返回值：

- String - 事务读写模式的字符串。
