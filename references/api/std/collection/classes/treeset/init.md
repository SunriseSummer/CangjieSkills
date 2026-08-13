<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.init" parent="std.collection.class.treeset" -->
# TreeSet<T> where T <: Comparable<T>.init

[← TreeSet<T> where T <: Comparable<T>](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个空的 TreeSet。

## init(Collection<T>)

### 签名

```cangjie role=signature
public init(elements: Collection<T>)
```

通过传入的元素集合构造一个 TreeSet。

### 契约

按照 elements 的迭代器顺序将元素插入到 TreeSet 内，由于 TreeSet 中不允许出现相同的元素，如果 elements 中有多个相同的元素时，TreeSet 只会保留一个元素。

参数：

- elements: Collection\<T> - 初始化该 TreeSet 的元素集合。

## init(Int64, (Int64) -> T)

### 签名

```cangjie role=signature
public init(size: Int64, initElement: (Int64) -> T)
```

通过传入的元素个数 size 和函数规则来构造 TreeSet。

### 契约

参数：

- size: Int64 - 传入的元素个数。
- initElement: (Int64) -> T - 初始化该 TreeSet 的函数规则。

异常：

- IllegalArgumentException - 如果 size 小于 0 则抛出异常。
