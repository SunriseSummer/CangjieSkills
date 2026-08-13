<!-- cj-doc kind="api-package" level="4" id="std.collection.concurrent" parent="api.std" -->
# std.collection.concurrent

[← std 包索引](../index.md)

提供了并发安全的集合类型实现。

包路径：`std.collection.concurrent`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`ArrayBlockingQueue<E>`](classes/arrayblockingqueue/index.md) | 自带容量限制及阻塞、超时、非阻塞入队出队协议。 |
| [`ConcurrentHashMap<K, V> <: ConcurrentMap<K, V> & Collection<(K, V)> where K <: Hashable & Equatable<K>`](classes/concurrenthashmap/index.md) | 此类用于实现并发场景下线程安全的哈希表 ConcurrentHashMap 数据结构及相关操作函数。 |
| [`ConcurrentHashMapIterator<K, V> <: Iterator<(K, V)> where K <: Hashable & Equatable<K>`](classes/concurrenthashmapiterator/index.md) | 此类主要实现 ConcurrentHashMap 的迭代器功能。 |
| [`ConcurrentLinkedQueue<E> <: Collection<E>`](classes/concurrentlinkedqueue/index.md) | 提供一个线程安全的队列，可以在多线程环境下安全地进行元素的添加和删除操作。 |
| [`LinkedBlockingQueue<E>`](classes/linkedblockingqueue/index.md) | 实现是带阻塞机制并支持用户指定容量上界的并发队列。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`ConcurrentMap<K, V>`](interfaces/concurrentmap/index.md) | 保证线程安全和操作原子性的 Map 接口定义。 |
