<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.init" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.init

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个空的 TreeMap。

## init(Array<(K,V)>)

### 签名

```cangjie role=signature
public init(elements: Array<(K,V)>)
```

通过传入的键值对数组构造一个 TreeMap。

### 契约

按照 elements 的先后顺序将元素插入到 TreeMap 内，由于 TreeMap 中不允许出现相同的键，如果 elements 中有相同的键时，后出现的键值对将会覆盖先出现的键值对。

参数：

- elements: Array\<(K, V)> - 初始化该 TreeMap 的键值对数组。

## init(Collection<(K, V)>)

### 签名

```cangjie role=signature
public init(elements: Collection<(K, V)>)
```

通过传入的键值对集合构造一个 TreeMap。

### 契约

按照 elements 的迭代器顺序将元素插入到 TreeMap 内，由于 TreeMap 中不允许出现相同的键，如果 elements 中有相同的键时，后出现（迭代器顺序）的键值对将会覆盖先出现的键值对。

参数：

- elements: Collection\<(K, V)> - 初始化该 TreeMap 的键值对集合。

## init(Int64, (Int64) -> (K, V))

### 签名

```cangjie role=signature
public init(size: Int64, initElement: (Int64) -> (K, V))
```

通过传入的元素个数 size 和函数规则来构造 TreeMap。

### 契约

参数：

- size: Int64 - 传入的元素个数。
- initElement: (Int64) -> (K, V) - 初始化该 TreeMap 的函数规则。

异常：

- IllegalArgumentException - 如果 size 小于 0 则抛出异常。
