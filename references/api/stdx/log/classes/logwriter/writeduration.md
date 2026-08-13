<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.writeduration" parent="stdx.log.class.logwriter" -->
# LogWriter.writeDuration

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func writeDuration(v: Duration): Unit
```

向日志输出目标中写入 Duration 值。

## 契约

参数：

- v: Duration - 待写入的 Duration 值。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时。
