<!-- cj-doc kind="api-member" level="6" id="stdx.log.struct.loglevel.operator-ne" parent="stdx.log.struct.loglevel" -->
# LogLevel.!=

[← LogLevel](index.md)

## 签名

```cangjie role=signature
public operator func !=(rhs: LogLevel): Bool
```

比较日志级别高低。

## 契约

参数：

- rhs: LogLevel - 将当前日志级别和 `target` 进行比较。

返回值：

- Bool - 如果当前日志级别不等于 `target`，返回 `true`，否则返回 `false`。
