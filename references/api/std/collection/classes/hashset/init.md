<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashset.init" parent="std.collection.class.hashset" -->
# HashSet<T> where T <: Hashable & Equatable<T>.init

[← HashSet<T> where T <: Hashable & Equatable<T>](index.md)

本页汇总 5 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个空的 HashSet，初始容量为 16。

## init(Array<T>)

### 签名

```cangjie role=signature
public init(elements: Array<T>)
```

使用传入的数组构造 HashSet。

### 契约

功能：使用传入的数组构造 HashSet。该构造函数根据传入数组 elements 的 size 设置 HashSet 的容量。

参数：

- elements: Array\<T> - 初始化 HashSet 的数组。

## init(Collection<T>)

### 签名

```cangjie role=signature
public init(elements: Collection<T>)
```

使用传入的集合构造 HashSet。

### 契约

功能：使用传入的集合构造 HashSet。该构造函数根据传入集合 elements 的 size 设置 HashSet 的容量。

参数：

- elements: Collection\<T> - 初始化 HashSet 的集合。

## init(Int64)

### 签名

```cangjie role=signature
public init(capacity: Int64)
```

使用传入的容量构造一个 HashSet。

### 契约

参数：

- capacity: Int64 - 初始化容量大小。

异常：

- IllegalArgumentException - 如果 capacity 小于 0，抛出异常。

## init(Int64, (Int64) -> T)

### 签名

```cangjie role=signature
public init(size: Int64, initElement: (Int64) -> T)
```

通过传入的函数元素个数 size 和函数规则来构造 HashSet。

### 契约

功能：通过传入的函数元素个数 size 和函数规则来构造 HashSet。构造出的 HashSet 的容量受 size 大小影响。

参数：

- size: Int64 - 初始化函数中元素的个数。
- initElement: (Int64) ->T - 初始化函数规则。

异常：

- IllegalArgumentException - 如果 size 小于 0，抛出异常。
