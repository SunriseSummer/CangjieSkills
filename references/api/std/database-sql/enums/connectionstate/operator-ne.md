<!-- cj-doc kind="api-member" level="6" id="std.database.sql.enum.connectionstate.operator-ne" parent="std.database.sql.enum.connectionstate" -->
# ConnectionState.!=

[← ConnectionState](index.md)

## 签名

```cangjie role=signature
public operator func !=(rhs: ConnectionState): Bool
```

判断数据源连接状态是否不同。

## 契约

参数：

- rhs: ConnectionState - 数据源连接状态。

返回值：

- Bool - 传入数据源连接状态与当前状态相同则返回 `false` ，否则返回 `true`。
