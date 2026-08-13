<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.interface.arbitrary" parent="std.unittest.prop_test" -->
# Arbitrary<T>

[← std.unittest.prop_test](../../index.md)

`Arbitrary<T>`

生成 T 类型随机值的接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static arbitrary(random: RandomSource): Generator<T>`](arbitrary/index.md) | 获取生成 T 类型随机值生成器。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Bool <: Arbitrary<Bool>`](extensions/extend-bool-arbitrary-bool.md) | 为 Bool 实现了 Arbitrary<T> 接口。 |
| [`extend Float16 <: Arbitrary<Float16>`](extensions/extend-float16-arbitrary-float16.md) | 为 Float16 实现了 Arbitrary<T> 接口。 |
| [`extend Float32 <: Arbitrary<Float32>`](extensions/extend-float32-arbitrary-float32.md) | 为 Float32 实现了 Arbitrary<T> 接口。 |
| [`extend Float64 <: Arbitrary<Float64>`](extensions/extend-float64-arbitrary-float64.md) | 为 Float64 实现了 Arbitrary<T> 接口。 |
| [`extend Int16 <: Arbitrary<Int16>`](extensions/extend-int16-arbitrary-int16.md) | 为 Int16 实现了 Arbitrary<T> 接口。 |
| [`extend Int32 <: Arbitrary<Int32>`](extensions/extend-int32-arbitrary-int32.md) | 为 Int32 实现了 Arbitrary<T> 接口。 |
| [`extend Int64 <: Arbitrary<Int64>`](extensions/extend-int64-arbitrary-int64.md) | 为 Int64 实现了 Arbitrary<T> 接口。 |
| [`extend Int8 <: Arbitrary<Int8>`](extensions/extend-int8-arbitrary-int8.md) | 为 Int8 实现了 Arbitrary<T> 接口。 |
| [`extend IntNative <: Arbitrary<IntNative>`](extensions/extend-intnative-arbitrary-intnative.md) | 为 IntNative 实现了 Arbitrary<T> 接口。 |
| [`extend Ordering <: Arbitrary<Ordering>`](extensions/extend-ordering-arbitrary-ordering.md) | 为 Ordering 实现了 Arbitrary<T> 接口。 |
| [`extend Rune <: Arbitrary<Rune>`](extensions/extend-rune-arbitrary-rune.md) | 为 Rune 实现了 Arbitrary<T> 接口。 |
| [`extend String <: Arbitrary<String>`](extensions/extend-string-arbitrary-string.md) | 为 String 实现了 Arbitrary<T> 接口。 |
| [`extend UInt16 <: Arbitrary<UInt16>`](extensions/extend-uint16-arbitrary-uint16.md) | 为 UInt16 实现了 Arbitrary<T> 接口。 |
| [`extend UInt32 <: Arbitrary<UInt32>`](extensions/extend-uint32-arbitrary-uint32.md) | 为 UInt32 实现了 Arbitrary<T> 接口。 |
| [`extend UInt64 <: Arbitrary<UInt64>`](extensions/extend-uint64-arbitrary-uint64.md) | 为 UInt64 实现了 Arbitrary<T> 接口。 |
| [`extend UInt8 <: Arbitrary<UInt8>`](extensions/extend-uint8-arbitrary-uint8.md) | 为 UInt8 实现了 Arbitrary<T> 接口。 |
| [`extend UIntNative <: Arbitrary<UIntNative>`](extensions/extend-uintnative-arbitrary-uintnative.md) | 为 UIntNative 实现了 Arbitrary<T> 接口。 |
| [`extend Unit <: Arbitrary<Unit>`](extensions/extend-unit-arbitrary-unit.md) | 为 Unit 实现了 Arbitrary<T> 接口。 |
| [`extend<T> Array<T> <: Arbitrary<Array<T>> where T <: Arbitrary<T>`](extensions/extend-t-array-t-arbitrary-array-t-where-t-arbitrary-t.md) | 为 Array<T> 实现了 Arbitrary<Array<T>> 接口，且 T 需实现 Arbitrary<T> 接口。 |
| [`extend<T> option<T> <: Arbitrary<Option<T>> where T <: Arbitrary<T>`](extensions/extend-t-option-t-arbitrary-option-t-where-t-arbitrary-t.md) | 为 Option<T> 实现了 Arbitrary<Option<T>> 接口，且 T 需实现 Arbitrary<T> 接口。 |
| [`extend<T> ArrayList<T> <: Arbitrary<ArrayList<T>> where T <: Arbitrary<T>`](extensions/extend-t-arraylist-t-arbitrary-arraylist-t-where-t-arbitrary-t.md) | 为 ArrayList<T> 实现了 Arbitrary 接口，且 T 需实现 Arbitrary<T> 接口。 |
| [`extend<T> HashSet<T> <: Arbitrary<HashSet<T>> where T <: Arbitrary<T>`](extensions/extend-t-hashset-t-arbitrary-hashset-t-where-t-arbitrary-t.md) | 为 HashSet<T> 实现了 Arbitrary 接口，且 T 需实现 Arbitrary<T> 接口。 |
| [`extend<K, V> HashMap<K, V> <: Arbitrary<HashMap<K, V>> where K <: Arbitrary<K>, V <: Arbitrary<V>`](extensions/extend-k-v-hashmap-k-v-arbitrary-hashmap-k-v-where-k-arbitrary-38aa567f.md) | 为 HashMap<T> 实现了 Arbitrary 接口，且 T 需实现 Arbitrary<T> 接口。 |
