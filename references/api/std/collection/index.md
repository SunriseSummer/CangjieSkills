<!-- cj-doc kind="api-package" level="4" id="std.collection" parent="api.std" -->
# std.collection

[← std 包索引](../index.md)

提供常见数据结构、集合抽象接口和通用集合函数。

包路径：`std.collection`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`ArrayDeque<T> <: Deque<T>`](classes/arraydeque/index.md) | ArrayDeque 是双端队列（deque）实现类，可以在双端队列的两端进行元素的插入和删除操作。 |
| [`ArrayList<T> <: List<T>`](classes/arraylist/index.md) | 提供可变长度的数组的功能。 |
| [`ArrayQueue<T> <: Queue<T>`](classes/arrayqueue/index.md) | 基于数组实现的循环队列数据结构。 |
| [`ArrayStack<T> <: Stack<T>`](classes/arraystack/index.md) | ArrayStack 是一种基于数组 Array 实现的栈 Stack 数据结构。 |
| [`HashMap<K, V> <: Map<K, V> where K <: Hashable & Equatable<K>`](classes/hashmap/index.md) | Map 接口的哈希表实现。 |
| [`HashMapIterator<K, V> <: Iterator<(K, V)> where K <: Hashable & Equatable<K>`](classes/hashmapiterator/index.md) | 此类主要实现 HashMap 的迭代器功能。 |
| [`HashSet<T> <: Set<T> where T <: Hashable & Equatable<T>`](classes/hashset/index.md) | 基于 HashMap 实现的 Set 接口的实例。 |
| [`LinkedList<T> <: Collection<T>`](classes/linkedlist/index.md) | 实现双向链表的数据结构。 |
| [`LinkedListNode<T>`](classes/linkedlistnode/index.md) | LinkedListNode 是 LinkedList 上的节点。 |
| [`TreeMap<K, V> <: OrderedMap<K, V> where K <: Comparable<K>`](classes/treemap/index.md) | 基于平衡二叉搜索树实现的 OrderedMap 接口实例。 |
| [`TreeSet<T> <: OrderedSet<T> where T <: Comparable<T>`](classes/treeset/index.md) | 基于 TreeMap 实现的 Set 接口的实例。 |
| [`ConcurrentModificationException <: Exception`](classes/concurrentmodificationexception/index.md) | 并发修改异常类。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`Deque<T> <: Collection<T>`](interfaces/deque/index.md) | Deque（double-ended queue）是一种具有队列和栈特性的数据结构，允许从两端插入和删除元素。 |
| [`EquatableCollection<T> <: Collection<T>`](interfaces/equatablecollection/index.md) | 定义了可以进行比较的集合类型。 |
| [`List<T> <: ReadOnlyList<T>`](interfaces/list/index.md) | 定义了只提供对索引友好操作的列表类型。 |
| [`Map<K, V> <: ReadOnlyMap<K, V>`](interfaces/map/index.md) | Map 接口提供了一种将键映射到值的方式。 |
| [`MapEntryView<K, V>`](interfaces/mapentryview/index.md) | 提供映射中的某个 key 对应的视图。 |
| [`OrderedMap<K, V> <: Map<K, V>`](interfaces/orderedmap/index.md) | OrderedMap 接口提供了一种将键映射到值的方式。 |
| [`OrderedSet<T> <: Set<T>`](interfaces/orderedset/index.md) | OrderedSet 接口提供了一组集合的相关操作，允许我们以可读写的方式操作内部元素。 |
| [`Queue<T> <: Collection<T>`](interfaces/queue/index.md) | 队列数据结构，它遵循先进先出（First In First Out, FIFO）原则。 |
| [`ReadOnlyList<T> <: Collection<T>`](interfaces/readonlylist/index.md) | 定义了只读列表。 |
| [`ReadOnlyMap<K, V> <: Collection<(K, V)>`](interfaces/readonlymap/index.md) | ReadOnlyMap 接口提供了一种将键映射到值的方式。 |
| [`ReadOnlySet<T> <: Collection<T>`](interfaces/readonlyset/index.md) | ReadOnlySet 接口提供了一组集合的相关操作，允许我们以只读方式操作内部元素。 |
| [`Set<T> <: ReadOnlySet<T>`](interfaces/set/index.md) | Set 接口提供了一组集合的相关操作，允许我们以可读写的方式操作内部元素。 |
| [`Stack<T> <: Collection<T>`](interfaces/stack/index.md) | Stack（栈）是一种数据结构，具有后进先出（Last In First Out，LIFO）的特点。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`all<T>(predicate: (T) -> Bool): (Iterable<T>) -> Bool`](functions/all-t-t-bool.md) | 判断迭代器所有元素是否都满足条件。 |
| [`any<T>(predicate: (T) -> Bool): (Iterable<T>) -> Bool`](functions/any-t-t-bool.md) | 判断迭代器是否存在任意一个满足条件的元素。 |
| [`at<T>(n: Int64): (Iterable<T>) -> Option<T>`](functions/at-t-int64.md) | 获取迭代器指定位置的元素。 |
| [`collectArray<T>(it: Iterable<T>): Array<T>`](functions/collectarray-t-iterable-t.md) | 将一个迭代器转换成 Array 类型。 |
| [`collectArrayList<T>(it: Iterable<T>): ArrayList<T>`](functions/collectarraylist-t-iterable-t.md) | 将一个迭代器转换成 ArrayList 类型。 |
| [`collectHashMap<K, V>(it: Iterable<(K, V)>): HashMap<K, V> where K <: Hashable & Equatable<K>`](functions/collecthashmap-k-v-iterable-k-v-where-k-hashable-equatable-k.md) | 将一个迭代器转换成 HashMap 类型。 |
| [`collectHashSet<T>(it: Iterable<T>): HashSet<T> where T <: Hashable & Equatable<T>`](functions/collecthashset-t-iterable-t-where-t-hashable-equatable-t.md) | 将一个迭代器转换成 HashSet 类型。 |
| [`collectString<T>(delimiter!: String = ""): (Iterable<T>) -> String where T <: ToString`](functions/collectstring-t-string-where-t-tostring.md) | 将一个对应元素实现了 ToString 接口的迭代器转换成 String 类型。 |
| [`concat<T>(other: Iterable<T>): (Iterable<T>) -> Iterator<T>`](functions/concat-t-iterable-t.md) | 串联两个迭代器。 |
| [`contains<T>(element: T): (Iterable<T>) -> Bool where T <: Equatable<T>`](functions/contains-t-t-where-t-equatable-t.md) | 获得一个针对特定元素的查找函数。 |
| [`count<T>(it: Iterable<T>): Int64`](functions/count-t-iterable-t.md) | 统计迭代器包含元素数量。 |
| [`enumerate<T>(it: Iterable<T>): Iterator<(Int64, T)>`](functions/enumerate-t-iterable-t.md) | 用于获取带索引的迭代器。 |
| [`filter<T>(predicate: (T) -> Bool): (Iterable<T>) -> Iterator<T>`](functions/filter-t-t-bool.md) | 筛选出满足条件的元素。 |
| [`filterMap<T, R>(transform: (T) -> ?R): (Iterable<T>) -> Iterator<R>`](functions/filtermap-t-r-t-r.md) | 同时进行筛选操作和映射操作，返回一个新的迭代器。 |
| [`first<T>(it: Iterable<T>): Option<T>`](functions/first-t-iterable-t.md) | 获取头部元素。 |
| [`flatMap<T, R>(transform: (T) -> Iterable<R>): (Iterable<T>) -> Iterator<R>`](functions/flatmap-t-r-t-iterable-r.md) | 创建一个带 flatten 功能的映射。 |
| [`flatten<T, R>(it: Iterable<T>): Iterator<R> where T <: Iterable<R>`](functions/flatten-t-r-iterable-t-where-t-iterable-r.md) | 将嵌套的迭代器展开一层。 |
| [`fold<T, R>(initial: R, operation: (R, T) -> R): (Iterable<T>) -> R`](functions/fold-t-r-r-r-t-r.md) | 使用指定初始值，从左向右计算。 |
| [`forEach<T>(action: (T) -> Unit): (Iterable<T>) -> Unit`](functions/foreach-t-t-unit.md) | 遍历所有元素，指定给定的操作。 |
| [`inspect<T>(action: (T)->Unit): (Iterable<T>) ->Iterator<T>`](functions/inspect-t-t-unit.md) | 迭代器每次调用 next() 对当前元素执行额外操作（不会消耗迭代器中元素）。 |
| [`isEmpty<T>(it: Iterable<T>): Bool`](functions/isempty-t-iterable-t.md) | 判断迭代器是否为空。 |
| [`last<T>(it: Iterable<T>): Option<T>`](functions/last-t-iterable-t.md) | 获取尾部元素。 |
| [`map<T, R>(transform: (T) -> R): (Iterable<T>) -> Iterator<R>`](functions/map-t-r-t-r.md) | 创建一个映射。 |
| [`max<T>(it: Iterable<T>): Option<T> where T <: Comparable<T>`](functions/max-t-iterable-t-where-t-comparable-t.md) | 筛选最大的元素。 |
| [`min<T>(it: Iterable<T>): Option<T> where T <: Comparable<T>`](functions/min-t-iterable-t-where-t-comparable-t.md) | 筛选最小的元素。 |
| [`none<T>(predicate: (T) -> Bool): (Iterable<T>) -> Bool`](functions/none-t-t-bool.md) | 判断迭代器中所有元素是否都不满足条件。 |
| [`reduce<T>(operation: (T, T) -> T): (Iterable<T>) -> Option<T>`](functions/reduce-t-t-t-t.md) | 使用第一个元素作为初始值，从左向右计算。 |
| [`skip<T>(count: Int64): (Iterable<T>) -> Iterator<T>`](functions/skip-t-int64.md) | 从迭代器跳过特定个数。 |
| [`step<T>(count: Int64): (Iterable<T>) -> Iterator<T>`](functions/step-t-int64.md) | 迭代器每次调用 next() 跳过特定个数。 |
| [`take<T>(count: Int64): (Iterable<T>) -> Iterator<T>`](functions/take-t-int64.md) | 从迭代器取出特定个数。 |
| [`zip<T, R>(other: Iterable<R>): (Iterable<T>) -> Iterator<(T, R)>`](functions/zip-t-r-iterable-r.md) | 将两个迭代器合并成一个（长度取决于短的那个迭代器）。 |
