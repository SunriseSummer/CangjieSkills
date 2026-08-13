<!-- cj-doc kind="api-type" level="5" id="stdx.log.class.logwriter" parent="stdx.log" -->
# LogWriter

[← stdx.log](../../index.md)

`abstract LogWriter`

LogWriter 提供了将仓颉对象序列化成日志输出目标的能力。

## 方法

| 签名 | 功能 |
|---|---|
| [`endArray(): Unit`](endarray.md) | 结束序列化当前的 LogValue 数组。 |
| [`endObject(): Unit`](endobject.md) | 结束序列化当前的 LogValue object。 |
| [`startArray(): Unit`](startarray.md) | 开始序列化一个新的 LogValue 数组，每一个 startArray 都必须有一个 endArray 对应。 |
| [`startObject(): Unit`](startobject.md) | 开始序列化一个新的 LogValue object，每一个 startObject 都必须有一个 endObject 对应。 |
| [`writeBool(v: Bool): Unit`](writebool.md) | 向日志输出目标中写入 Bool 值。 |
| [`writeFloat(v: Float64): Unit`](writefloat.md) | 向日志输出目标中写入 Float64 值。 |
| [`writeDateTime(v: DateTime): Unit`](writedatetime.md) | 向日志输出目标中写入 DateTime 值。 |
| [`writeDuration(v: Duration): Unit`](writeduration.md) | 向日志输出目标中写入 Duration 值。 |
| [`writeException(v: Exception): Unit`](writeexception.md) | 向日志输出目标中写入 Exception 值。 |
| [`writeInt(v: Int64): Unit`](writeint.md) | 向日志输出目标中写入 Int64 值。 |
| [`writeKey(v: String): Unit`](writekey.md) | 向日志输出目标中写入 name。 |
| [`writeNone(): Unit`](writenone.md) | 向日志输出目标中写入 None，具体写成什么格式由 Logger 的提供者自行决定。 |
| [`writeString(v: String): Unit`](writestring.md) | 向日志输出目标中写入 String 值。 |
| [`writeValue(v: LogValue): Unit`](writevalue.md) | 将实现了 LogValue 接口的类型写入到日志输出目标中。 |
