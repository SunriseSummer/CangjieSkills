<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.writeint" parent="stdx.log.class.logwriter" -->
# LogWriter.writeInt

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func writeInt(v: Int64): Unit
```

向日志输出目标中写入 Int64 值。

## 契约

参数：

- v: Int64 - 待写入的 Int64 值。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时。
