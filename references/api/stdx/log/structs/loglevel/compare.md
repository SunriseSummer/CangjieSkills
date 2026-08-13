<!-- cj-doc kind="api-member" level="6" id="stdx.log.struct.loglevel.compare" parent="stdx.log.struct.loglevel" -->
# LogLevel.compare

[← LogLevel](index.md)

## 签名

```cangjie role=signature
public func compare(rhs: LogLevel): Ordering
```

判断当前 LogLevel 类型实例与参数指向的 LogLevel 类型实例的大小关系。

## 契约

参数：

- rhs: LogLevel - 待与当前实例比较的另一个实例。

返回值：

- Ordering - 如果大于，返回 Ordering.GT，如果等于，返回 Ordering.EQ，如果小于，返回 Ordering.LT。
