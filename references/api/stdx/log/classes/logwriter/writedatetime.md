<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.writedatetime" parent="stdx.log.class.logwriter" -->
# LogWriter.writeDateTime

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func writeDateTime(v: DateTime): Unit
```

向日志输出目标中写入 DateTime 值。

## 契约

参数：

- v: DateTime - 待写入的 DateTime 值。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时。
