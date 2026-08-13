<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.init" parent="std.collection.class.hashmap" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.init

[← HashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

本页汇总 5 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个具有默认初始容量为 16 和默认负载因子为空的 HashMap。

## init(Array<(K, V)>)

### 签名

```cangjie role=signature
public init(elements: Array<(K, V)>)
```

通过传入的键值对数组构造一个 HashMap。

### 契约

该构造函数根据传入数组的 size 设置 HashMap 的容量。由于 HashMap 内部不允许键重复，当 Array 中存在重复的键时，按照迭代器顺序，出现在后面的键值对将会覆盖前面的键值对。

参数：

- elements: Array\<(K, V)> - 初始化该 HashMap 的键值对数组。

## init(Collection<(K, V)>)

### 签名

```cangjie role=signature
public init(elements: Collection<(K, V)>)
```

通过传入的键值对集合构造一个 HashMap。

### 契约

该构造函数根据传入集合 elements 的 size 设置 HashMap 的容量。由于 HashMap 内部不允许键重复，当 Array 中存在重复的键时，按照迭代器顺序，出现在后面的键值对将会覆盖前面的键值对。

参数：

- elements: Collection\<(K, V)> - 初始化该 HashMap 的键值对集合。

## init(Int64)

### 签名

```cangjie role=signature
public init(capacity: Int64)
```

构造一个带有传入容量大小的 HashMap。

### 契约

参数：

- capacity: Int64 - 初始化容量大小。

异常：

- IllegalArgumentException - 如果 capacity 小于 0 则抛出异常。

## init(Int64, (Int64) -> (K, V))

### 签名

```cangjie role=signature
public init(size: Int64, initElement: (Int64) -> (K, V))
```

通过传入的元素个数 size 和函数规则来构造 HashMap。

### 契约

构造出的 HashMap 的容量受 size 大小影响。由于 HashMap 内部不允许键重复，当函数 initElement 生成相同的键时，后构造的键值对将会覆盖之前出现的键值对。

参数：

- size: Int64 - 初始化该 HashMap 的函数规则。
- initElement: (Int64) -> (K, V) - 初始化该 HashMap 的函数规则。

异常：

- IllegalArgumentException - 如果 size 小于 0 则抛出异常。
