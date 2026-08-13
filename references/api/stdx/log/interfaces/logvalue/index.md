<!-- cj-doc kind="api-type" level="5" id="stdx.log.interface.logvalue" parent="stdx.log" -->
# LogValue

[← stdx.log](../../index.md)

`LogValue`

为类型提供序列化到日志输出目标的接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`writeTo(w: LogWriter): Unit`](writeto.md) | 将实现了 LogValue 接口的类型写入参数 `w` 指定的 LogWriter 实例中。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Bool <: LogValue`](extensions/extend-bool-logvalue.md) | 为 Bool 类型实现 LogValue 接口。 |
| [`extend Exception <: LogValue`](extensions/extend-exception-logvalue.md) | 为 Exception 类型实现 LogValue 接口。 |
| [`extend Int64 <: LogValue`](extensions/extend-int64-logvalue.md) | 为 Int64 类型实现 LogValue 接口。 |
| [`extend Float64 <: LogValue`](extensions/extend-float64-logvalue.md) | 为 Float64 类型实现 LogValue 接口。 |
| [`extend String <: LogValue`](extensions/extend-string-logvalue.md) | 为 String 类型实现 LogValue 接口。 |
| [`extend DateTime <: LogValue`](extensions/extend-datetime-logvalue.md) | 为 DateTime 类型实现 LogValue 接口。 |
| [`extend Duration <: LogValue`](extensions/extend-duration-logvalue.md) | 为 Duration 类型实现 LogValue 接口。 |
| [`extend<T> Array<T> <: LogValue where T <: LogValue`](extensions/extend-t-array-t-logvalue-where-t-logvalue.md) | 为 Array<T> 类型实现 LogValue 接口。 |
| [`extend<V> HashMap<String, V> <: LogValue where V <: LogValue`](extensions/extend-v-hashmap-string-v-logvalue-where-v-logvalue.md) | 为 HashMap<K, V> 类型实现 LogValue 接口。 |
| [`extend<V> TreeMap<String, V> <: LogValue where V <: LogValue`](extensions/extend-v-treemap-string-v-logvalue-where-v-logvalue.md) | 为 TreeMap<K, V> 类型实现 LogValue 接口。 |
| [`extend<T> Option<T> <: LogValue where T <: LogValue`](extensions/extend-t-option-t-logvalue-where-t-logvalue.md) | 为 Option<T> 类型实现 LogValue 接口。 |
