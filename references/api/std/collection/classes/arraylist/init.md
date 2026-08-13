<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.init" parent="std.collection.class.arraylist" -->
# ArrayList<T>.init

[← ArrayList<T>](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个初始容量大小为默认值`16`的 ArrayList。

## init(Collection<T>)

### 签名

```cangjie role=signature
public init(elements: Collection<T>)
```

构造一个包含指定集合中所有元素的 ArrayList。

### 契约

功能：构造一个包含指定集合中所有元素的 ArrayList。这些元素按照集合的迭代器返回的顺序排列。

参数：

- elements: Collection\<T> - 传入集合。

## init(Int64)

### 签名

```cangjie role=signature
public init(capacity: Int64)
```

构造一个初始容量为指定大小的 ArrayList。

### 契约

参数：

- capacity: Int64 - 指定的初始容量大小。

异常：

- IllegalArgumentException - 如果参数的大小小于 0 则抛出异常。

## init(Int64, (Int64) -> T)

### 签名

```cangjie role=signature
public init(size: Int64, initElement: (Int64) -> T)
```

构造具有指定初始元素个数和指定规则函数的 ArrayList。

### 契约

功能：构造具有指定初始元素个数和指定规则函数的 ArrayList。该构造函数根据参数 size 设置 ArrayList 的容量。

参数：

- size: Int64 - 初始化函数元素个数。
- initElement: (Int64) ->T - 传入初始化函数。

异常：

- IllegalArgumentException - 如果 size 小于 0 则抛出异常。
