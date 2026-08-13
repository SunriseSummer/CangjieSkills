<!-- cj-doc kind="api-type" level="5" id="std.ast.interface.totokens" parent="std.ast" -->
# ToTokens

[← std.ast](../../index.md)

`ToTokens`

实现对应类型的实例到 Tokens 类型转换的接口，作为支持 `quote` 插值操作必须实现的接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens/index.md) | 实现对应类型的实例到 Tokens 类型的转换。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> Array<T> <: ToTokens`](extensions/extend-t-array-t-totokens.md) | 实现 Array<T> 类型到 Tokens 类型的转换。 |
| [`extend<T> ArrayList<T> <: ToTokens`](extensions/extend-t-arraylist-t-totokens.md) | 实现 ArrayList<T> 类型到 Tokens 类型的转换。 |
| [`extend Bool <: ToTokens`](extensions/extend-bool-totokens.md) | 实现 Bool 类型到 Tokens 类型的转换。 |
| [`extend Float16 <: ToTokens`](extensions/extend-float16-totokens.md) | 实现 Float16 类型到 Tokens 类型的转换。 |
| [`extend Float32 <: ToTokens`](extensions/extend-float32-totokens.md) | 实现 Float32 类型到 Tokens 类型的转换。 |
| [`extend Float64 <: ToTokens`](extensions/extend-float64-totokens.md) | 实现 Float64 类型到 Tokens 类型的转换。 |
| [`extend Int16 <: ToTokens`](extensions/extend-int16-totokens.md) | 实现 Int16 类型到 Tokens 类型的转换。 |
| [`extend Int32 <: ToTokens`](extensions/extend-int32-totokens.md) | 实现 Int32 类型到 Tokens 类型的转换。 |
| [`extend Int64 <: ToTokens`](extensions/extend-int64-totokens.md) | 实现 Int64 类型到 Tokens 类型的转换。 |
| [`extend Int8 <: ToTokens`](extensions/extend-int8-totokens.md) | 实现 Int8 类型到 Tokens 类型的转换。 |
| [`extend Rune <: ToTokens`](extensions/extend-rune-totokens.md) | 实现 Rune 类型到 Tokens 类型的转换。 |
| [`extend String <: ToTokens`](extensions/extend-string-totokens.md) | 实现 String 类型到 Tokens 类型的转换。 |
| [`extend Token <: ToTokens`](extensions/extend-token-totokens.md) | 实现 Token 类型到 Tokens 类型的转换。 |
| [`extend Tokens <: ToTokens`](extensions/extend-tokens-totokens.md) | 实现 Tokens 类型到 Tokens 类型的转换。 |
| [`extend UInt16 <: ToTokens`](extensions/extend-uint16-totokens.md) | 实现 UInt16 类型到 Tokens 类型的转换。 |
| [`extend UInt32 <: ToTokens`](extensions/extend-uint32-totokens.md) | 实现 UInt32 类型到 Tokens 类型的转换。 |
| [`extend UInt64 <: ToTokens`](extensions/extend-uint64-totokens.md) | 实现 UInt64 类型到 Tokens 类型的转换。 |
| [`extend UInt8 <: ToTokens`](extensions/extend-uint8-totokens.md) | 实现 UInt8 类型到 Tokens 类型的转换。 |
