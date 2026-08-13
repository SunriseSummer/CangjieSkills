<!-- cj-doc kind="api-member" level="6" id="std.database.sql.class.sqlexception.init" parent="std.database.sql.class.sqlexception" -->
# SqlException.init

[← SqlException](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

无参构造函数。

## init(String)

### 签名

```cangjie role=signature
public init(message: String)
```

根据异常信息创建 SqlException 实例。

### 契约

参数：

- message: String - 异常信息。

## init(String, String, Int64)

### 签名

```cangjie role=signature
public init(message: String, sqlState: String, errorCode: Int64)
```

根据异常信息、SQL 语句状态、错误码信息，创建 SqlException 实例。

### 契约

参数：

- message: String - 异常信息。
- sqlState: String - 长度为五个字符的字符串，是数据库系统返回的最后执行的 sql 语句状态。
- errorCode: Int64 - 数据库供应商返回的整数错误代码。
