<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.endobject" parent="stdx.log.class.logwriter" -->
# LogWriter.endObject

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func endObject(): Unit
```

结束序列化当前的 LogValue object。

## 契约

异常：

- IllegalStateException - 当前 writer 的状态不应该结束一个 LogValue object 时。
