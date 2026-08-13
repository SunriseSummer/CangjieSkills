<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.writeexception" parent="stdx.log.class.logwriter" -->
# LogWriter.writeException

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func writeException(v: Exception): Unit
```

向日志输出目标中写入 Exception 值。

## 契约

参数：

- v: Exception - 待写入的 Exception 值。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时，抛出该异常。
