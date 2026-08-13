<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.writekey" parent="stdx.log.class.logwriter" -->
# LogWriter.writeKey

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func writeKey(v: String): Unit
```

向日志输出目标中写入 name。

## 契约

参数：

- v: String - 待写入的 Key 值。

异常：

- IllegalStateException - 当前 writer 的状态不应写入参数 `name` 指定字符串时。
