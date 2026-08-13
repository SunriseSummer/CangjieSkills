<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.init" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.init

[← LinkedList<T>](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个空的链表。

## init(Array<T>)

### 签名

```cangjie role=signature
public init(elements: Array<T>)
```

按照数组的遍历顺序构造一个包含指定集合元素的 LinkedList 实例。

### 契约

参数：

- elements: Array\<T> - 将要放入此链表中的元素数组。

## init(Collection<T>)

### 签名

```cangjie role=signature
public init(elements: Collection<T>)
```

按照集合迭代器返回元素的顺序构造一个包含指定集合元素的链表。

### 契约

参数：

- elements: Collection\<T> - 将要放入此链表中的元素集合。

## init(Int64, (Int64)-> T)

### 签名

```cangjie role=signature
public init(size: Int64, initElement: (Int64)-> T)
```

创建一个包含 size 个元素，且第 n 个元素满足 (Int64)-> T 条件的链表。

### 契约

参数：

- size: Int64 - 要创建的链表元素数量。
- initElement: (Int64) ->T - 元素的初始化参数。

异常：

- IllegalArgumentException - 如果指定的链表长度小于 0 则抛此异常。
