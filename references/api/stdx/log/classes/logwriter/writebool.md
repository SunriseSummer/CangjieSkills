<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.writebool" parent="stdx.log.class.logwriter" -->
# LogWriter.writeBool

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func writeBool(v: Bool): Unit
```

向日志输出目标中写入 Bool 值。

## 契约

参数：

- v: Bool - 待写入的 Bool 值。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时。
