# 仓颉集合类型

`std.collection` 主要负责通用集合结构和迭代器工具；`Array<T>` 虽然属于 `std.core`，但通常也会和集合一起使用。

## 详细文档

- [Array](./array/README.md)：定长数组、切片、拷贝、搜索与排序
- [ArrayList](./arraylist/README.md)：动态数组、插入删除、切片与排序
- [HashMap](./hashmap/README.md)：哈希映射、键值访问、批量更新与遍历
- [HashSet](./hashset/README.md)：哈希集合、集合运算、子集判断与过滤

## 其他常用 `std.collection` 类型速查

### ArrayDeque / ArrayQueue / ArrayStack

| 类型 | 核心能力 |
|------|----------|
| `ArrayDeque<T>` | 双端队列；`addFirst` / `addLast` / `removeFirst` / `removeLast` / `first` / `last` |
| `ArrayQueue<T>` | 队列；`add` / `remove` / `peek` |
| `ArrayStack<T>` | 栈；`add` / `remove` / `peek` |

### LinkedList

- 适合频繁头尾插入、删除
- `addFirst` / `addLast` / `addBefore` / `addAfter` 返回 `LinkedListNode<T>`
- 已持有节点时，可用 `addAfter(node, value)`、`remove(node)` 做 O(1) 位置操作

### TreeMap / TreeSet

- `TreeMap<K, V>`：基于有序树的映射，要求 `K <: Comparable<K>`
- `TreeSet<T>`：基于有序树的集合，要求 `T <: Comparable<T>`
- 遍历顺序稳定按键/元素排序，适合范围查询和有序输出

## 常用迭代器与收集函数

`std.collection.*` 还提供：

- 过滤/转换：`filter`、`map`、`filterMap`、`flatMap`
- 聚合查询：`fold`、`reduce`、`count`、`any`、`all`
- 迭代控制：`take`、`skip`、`enumerate`、`zip`
- 收集函数：`collectArray`、`collectArrayList`、`collectHashMap`、`collectHashSet`、`collectString`

## 使用要点

1. `HashMap` / `HashSet` 要求键或元素类型实现 `Hashable & Equatable`
2. `TreeMap` / `TreeSet` 要求键或元素类型实现 `Comparable`
3. `map[key]` 在键不存在时会抛异常；不确定时优先使用 `get()`
4. `Stack` / `Queue` / `Deque` 统一使用 `add` / `remove` / `peek` 风格接口
5. 这些集合默认都不是并发安全的；并发场景请改用 `std.collection.concurrent`
