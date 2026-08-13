<!-- cj-doc kind="api-type" level="5" id="stdx.serialization.serialization.interface.serializable" parent="stdx.serialization.serialization" -->
# Serializable

[← stdx.serialization.serialization](../../index.md)

`Serializable<T>`

用于规范序列化。

## 方法

| 签名 | 功能 |
|---|---|
| [`static deserialize(dm: DataModel): T`](deserialize/index.md) | 将 DataModel 反序列化为对象。 |
| [`serialize(): DataModel`](serialize/index.md) | 将自身序列化为 DataModel。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> Array<T> <: Serializable<Array<T>> where T <: Serializable<T>`](extensions/extend-t-array-t-serializable-array-t-where-t-serializable-t.md) | 为 Array<T> 类型实现 Serializable<Array<T>> 接口。 |
| [`extend<T> ArrayList<T> <: Serializable<ArrayList<T>> where T <: Serializable<T>`](extensions/extend-t-arraylist-t-serializable-arraylist-t-where-t-serializable-t.md) | 为 ArrayList<T> 类型实现 Serializable<ArrayList<T>> 接口。 |
| [`extend Bool <: Serializable<Bool>`](extensions/extend-bool-serializable.md) | 为 Bool 类型实现 Serializable 接口。 |
| [`extend Float16 <: Serializable<Float16>`](extensions/extend-float16-serializable.md) | 为 Float16 类型实现 Serializable 接口。 |
| [`extend Float32 <: Serializable<Float32>`](extensions/extend-float32-serializable.md) | 为 Float32 类型实现 Serializable 接口。 |
| [`extend Float64 <: Serializable<Float64>`](extensions/extend-float64-serializable.md) | 为 Float64 类型实现 Serializable 接口。 |
| [`extend<K, V> HashMap<K, V> <: Serializable<HashMap<K, V>> where K <: Serializable<K> & Hashable & Equatable<K>, V <: Serializable<V>`](extensions/extend-k-v-hashmap-k-v-serializable-hashmap-k-v-where-k-seriali-21aafa8d.md) | 为 HashMap<K, V> 类型实现 Serializable<HashMap<K, V>> 接口。 |
| [`extend<T> HashSet<T> <: Serializable<HashSet<T>> where T <: Serializable<T> & Hashable & Equatable<T>`](extensions/extend-t-hashset-t-serializable-hashset-t-where-t-serializable-b50b8121.md) | 为 HashSet<T> 类型实现 Serializable<HashSet<T>> 接口。 |
| [`extend Int16 <: Serializable<Int16>`](extensions/extend-int16-serializable.md) | 为 Int16 类型实现 Serializable 接口。 |
| [`extend Int32 <: Serializable<Int32>`](extensions/extend-int32-serializable.md) | 为 Int32 类型实现 Serializable 接口。 |
| [`extend Int64 <: Serializable<Int64>`](extensions/extend-int64-serializable.md) | 为 Int64 类型实现 Serializable 接口。 |
| [`extend Int8 <: Serializable<Int8>`](extensions/extend-int8-serializable.md) | 为 Int8 类型实现 Serializable 接口。 |
| [`extend<T> Option<T> <: Serializable<Option<T>> where T <: Serializable<T>`](extensions/extend-t-option-t-serializable-option-t-where-t-serializable-t.md) | 为 Option<T> 类型实现 Serializable<Option<T>> 接口。 |
| [`extend Rune <: Serializable<Rune>`](extensions/extend-rune-serializable.md) | 为 Rune 类型实现 Serializable 接口。 |
| [`extend String <: Serializable<String>`](extensions/extend-string-serializable.md) | 为 String 类型实现 Serializable 接口。 |
| [`extend UInt16 <: Serializable<UInt16>`](extensions/extend-uint16-serializable.md) | 为 UInt16 类型实现 Serializable 接口。 |
| [`extend UInt32 <: Serializable<UInt32>`](extensions/extend-uint32-serializable.md) | 为 UInt32 类型实现 Serializable 接口。 |
| [`extend UInt64 <: Serializable<UInt64>`](extensions/extend-uint64-serializable.md) | 为 UInt64 类型实现 Serializable 接口。 |
| [`extend UInt8 <: Serializable<UInt8>`](extensions/extend-uint8-serializable.md) | 为 UInt8 类型实现 Serializable 接口。 |
