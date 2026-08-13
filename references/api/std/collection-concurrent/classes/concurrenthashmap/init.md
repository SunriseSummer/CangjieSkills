<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrenthashmap.init" parent="std.collection.concurrent.class.concurrenthashmap" -->
# ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>.init

[← ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## init(Collection<(K, V)>, Int64)

### 签名

```cangjie role=signature
public init(elements: Collection<(K, V)>, concurrencyLevel!: Int64 = 16)
```

构造一个带有传入迭代器和指定并发度的 ConcurrentHashMap。

### 契约

功能：构造一个带有传入迭代器和指定并发度的 ConcurrentHashMap。该构造函数根据传入迭代器元素 elements 的 size 设置 ConcurrentHashMap 的容量。

参数：

- elements: Collection\<(K, V)> - 初始化迭代器元素。
- concurrencyLevel!: Int64 - 用户指定的并发度。

## init(Int64)

### 签名

```cangjie role=signature
public init(concurrencyLevel!: Int64 = 16)
```

构造一个具有默认初始容量（16）和指定并发度（默认等于 16）的 ConcurrentHashMap。

### 契约

参数：

- concurrencyLevel!: Int64 - 用户指定的并发度。

## init(Int64, (Int64) -> (K, V), Int64)

### 签名

```cangjie role=signature
public init(size: Int64, initElement: (Int64) -> (K, V), concurrencyLevel!: Int64 = 16)
```

构造具有传入大小和初始化函数元素以及指定并发度的 ConcurrentHashMap。

### 契约

功能：构造具有传入大小和初始化函数元素以及指定并发度的 ConcurrentHashMap。该构造函数根据参数 size 设置 ConcurrentHashMap 的容量。

参数：

- size: Int64 - 初始化函数元素的大小。
- initElement: (Int64) -> (K, V) - 初始化函数元素。
- concurrencyLevel!: Int64 - 用户指定并发度。

异常：

- IllegalArgumentException - 如果 size 小于 0 则抛出异常。

## init(Int64, Int64)

### 签名

```cangjie role=signature
public init(capacity: Int64, concurrencyLevel!: Int64 = 16)
```

构造一个带有传入容量大小和指定并发度（默认等于 16）的 ConcurrentHashMap。

### 契约

参数：

- capacity: Int64 - 初始化容量大小。
- concurrencyLevel!: Int64 - 用户指定的并发度。

异常：

- IllegalArgumentException - 如果 capacity 小于 0 则抛出异常。
