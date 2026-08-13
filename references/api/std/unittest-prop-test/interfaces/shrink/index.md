<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.interface.shrink" parent="std.unittest.prop_test" -->
# Shrink<T>

[← std.unittest.prop_test](../../index.md)

`Shrink<T>`

将 T 类型的值缩减到多个“更小”的值。

## 方法

| 签名 | 功能 |
|---|---|
| [`shrink(): Iterable<T>`](shrink/index.md) | 将该值缩小为一组可能的“较小”值。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Bool <: Shrink<Bool>`](extensions/extend-bool-shrink-bool.md) | 为 Bool 实现了 Shrink<T> 接口。 |
| [`extend Int16 <: Shrink<Int16>`](extensions/extend-int16-shrink-int16.md) | 为 Int16 实现了 Shrink<T> 接口。 |
| [`extend Int32 <: Shrink<Int32>`](extensions/extend-int32-shrink-int32.md) | 为 Int32 实现了 Shrink<T> 接口。 |
| [`extend Int64 <: Shrink<Int64>`](extensions/extend-int64-shrink-int64.md) | 为 Int64 实现了 Shrink<T> 接口。 |
| [`extend Int8 <: Shrink<Int8>`](extensions/extend-int8-shrink-int8.md) | 为 Int8 实现了 Shrink<T> 接口。 |
| [`extend IntNative <: Shrink<IntNative>`](extensions/extend-intnative-shrink-intnative.md) | 为 IntNative 实现了 Shrink<T> 接口。 |
| [`extend Rune <: Shrink<Rune>`](extensions/extend-rune-shrink-rune.md) | 为 Rune 实现了 Shrink<T> 接口。 |
| [`extend String <: Shrink<String>`](extensions/extend-string-shrink-string.md) | 为 String 实现了 Shrink<T> 接口。 |
| [`extend UInt16 <: Shrink<UInt16>`](extensions/extend-uint16-shrink-uint16.md) | 为 UInt16 实现了 Shrink<T> 接口。 |
| [`extend UInt32 <: Shrink<UInt32>`](extensions/extend-uint32-shrink-uint32.md) | 为 UInt32 实现了 Shrink<T> 接口。 |
| [`extend UInt64 <: Shrink<UInt64>`](extensions/extend-uint64-shrink-uint64.md) | 为 UInt64 实现了 Shrink<T> 接口。 |
| [`extend UInt8 <: Shrink<UInt8>`](extensions/extend-uint8-shrink-uint8.md) | 为 UInt8 实现了 Shrink<T> 接口。 |
| [`extend UIntNative <: Shrink<UIntNative>`](extensions/extend-uintnative-shrink-uintnative.md) | 为 UIntNative 实现了 Shrink<T> 接口。 |
| [`extend Unit <: Shrink<Unit>`](extensions/extend-unit-shrink-unit.md) | 为 Unit 实现了 Shrink<T> 接口。 |
| [`extend Float16 <: Shrink<Float16>`](extensions/extend-float16-shrink-float16.md) | 为 Float16 实现了 Shrink<T> 接口。 |
| [`extend Float32 <: Shrink<Float32>`](extensions/extend-float32-shrink-float32.md) | 为 Float32 实现了 Shrink<T> 接口。 |
| [`extend Float64 <: Shrink<Float64>`](extensions/extend-float64-shrink-float64.md) | 为 Float64 实现了 Shrink<T> 接口。 |
| [`extend<T> Array<T> <: Shrink<Array<T>>`](extensions/extend-t-array-t-shrink-array-t.md) | 为 Array<T> 实现了 Shrink<Array<T>> 接口。 |
| [`extend<T> Option<T> <: Shrink<Option<T>>`](extensions/extend-t-option-t-shrink-option-t.md) | 为 Option<T> 实现了 Shrink<Option<T>> 接口。 |
| [`extend<T> ArrayList<T> <: Shrink<ArrayList<T>>`](extensions/extend-t-arraylist-t-shrink-arraylist-t.md) | 为 ArrayList<T> 实现了 Shrink<ArrayList<T>> 接口。 |
| [`extend<T> HashSet<T> <: Shrink<HashSet<T>>`](extensions/extend-t-hashset-t-shrink-hashset-t.md) | 为 HashSet<T> 实现了 Shrink<HashSet<T>> 接口。 |
| [`extend<K, V> HashMap<K, V> <: Shrink<HashMap<K, V>>`](extensions/extend-k-v-hashmap-k-v-shrink-hashmap-k-v.md) | 为 HashMap<T> 实现了 Shrink<HashMap<T>> 接口。 |
