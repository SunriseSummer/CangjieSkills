<!-- cj-doc kind="api-extension" level="6" id="stdx.log.interface.logvalue.extension.extend-v-hashmap-string-v-logvalue-where-v-logvalue" parent="stdx.log.interface.logvalue" -->
# extend<V> HashMap<String, V> <: LogValue where V <: LogValue

[← LogValue](../index.md)

`extend<V> HashMap<String, V> <: LogValue where V <: LogValue`

为 HashMap<K, V> 类型实现 LogValue 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`writeTo(w: LogWriter): Unit`](../writeto.md) | 提供 HashMap<K, V> 类型序列化到流的功能。 |
