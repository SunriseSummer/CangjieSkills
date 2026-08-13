<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.startobject" parent="stdx.log.class.logwriter" -->
# LogWriter.startObject

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func startObject(): Unit
```

开始序列化一个新的 LogValue object，每一个 startObject 都必须有一个 endObject 对应。

## 契约

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 LogValue object 时。
