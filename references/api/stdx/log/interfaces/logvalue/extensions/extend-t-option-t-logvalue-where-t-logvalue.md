<!-- cj-doc kind="api-extension" level="6" id="stdx.log.interface.logvalue.extension.extend-t-option-t-logvalue-where-t-logvalue" parent="stdx.log.interface.logvalue" -->
# extend<T> Option<T> <: LogValue where T <: LogValue

[← LogValue](../index.md)

`extend<T> Option<T> <: LogValue where T <: LogValue`

为 Option<T> 类型实现 LogValue 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`writeTo(w: LogWriter): Unit`](../writeto.md) | 提供 Option<T> 类型序列化到流的功能。 |
