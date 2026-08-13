<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.writenone" parent="stdx.log.class.logwriter" -->
# LogWriter.writeNone

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func writeNone(): Unit
```

向日志输出目标中写入 None，具体写成什么格式由 Logger 的提供者自行决定。

## 契约

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时。
