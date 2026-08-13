<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.writefloat" parent="stdx.log.class.logwriter" -->
# LogWriter.writeFloat

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func writeFloat(v: Float64): Unit
```

向日志输出目标中写入 Float64 值。

## 契约

参数：

- v: Float64 - 待写入的 Float64 值。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时。
