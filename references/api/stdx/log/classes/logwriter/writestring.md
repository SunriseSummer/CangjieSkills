<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.writestring" parent="stdx.log.class.logwriter" -->
# LogWriter.writeString

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func writeString(v: String): Unit
```

向日志输出目标中写入 String 值。

## 契约

参数：

- v: String  - 待写入的 String 值。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时。
