<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logwriter.writevalue" parent="stdx.log.class.logwriter" -->
# LogWriter.writeValue

[← LogWriter](index.md)

## 签名

```cangjie role=signature
public func writeValue(v: LogValue): Unit
```

将实现了 LogValue 接口的类型写入到日志输出目标中。

## 契约

功能：将实现了 LogValue 接口的类型写入到日志输出目标中。该接口会调用 LogValue 的 writeTo 方法向日志输出目标中写入数据。

log 包已经为基础类型 Int64、Float64、Bool、String 类型扩展实现了 LogValue，并且为 DateTime、Duration、 Collection 类型 Array、HashMap 和 TreeMap 以及 Option\<T> 扩展实现了 LogValue。

参数：

- v: LogValue - 待写入的 LogValue 值。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时。
