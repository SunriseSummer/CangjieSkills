# 仓颉语言集合数据结构 Skill

## 1. 概述

`std.collection` 包提供丰富的泛型集合数据结构和函数式迭代操作，是仓颉标准库中最常用的包之一。

**导入**：`import std.collection.*`

详细文档请按需查询：

- [Array](./array/README.md)：定长数组（`std.core` 包，无需导入）
- [ArrayList](./arraylist/README.md)：可变长动态数组
- [HashMap](./hashmap/README.md)：哈希表/键值映射
- [HashSet](./hashset/README.md)：哈希集合

---

## 2. 其他集合类型

### 2.1 TreeMap — 有序映射

基于红黑树的有序映射，要求 `K <: Comparable<K>`，按键有序。

```cangjie
package test_proj
import std.collection.*

main() {
    let tm = TreeMap<String, Int64>([("banana", 2), ("apple", 1), ("cherry", 3)])

    // 按键有序遍历
    for ((k, v) in tm) {
        println("${k}: ${v}")
    }
    // 输出: apple: 1, banana: 2, cherry: 3

    println("size: ${tm.size}")
}
```

### 2.2 TreeSet — 有序集合

基于红黑树的有序集合，要求 `T <: Comparable<T>`，元素有序不重复。

```cangjie
package test_proj
import std.collection.*

main() {
    let ts = TreeSet<Int64>([3, 1, 4, 1, 5, 9, 2, 6])

    // 有序且去重
    for (v in ts) {
        print("${v} ")
    }
    println("")  // 1 2 3 4 5 6 9

    println("size: ${ts.size}")  // 7
}
```

### 2.3 LinkedList — 双向链表

双向链表，支持高效的头尾插入删除。核心方法是 `addFirst`/`addLast`/`removeFirst`/`removeLast`，以及基于 `LinkedListNode` 的精确位置操作。

`addFirst`/`addLast`/`addBefore`/`addAfter` 返回 `LinkedListNode<T>`，可用于后续精确位置插入或删除：

```cangjie
package test_proj
import std.collection.*

main() {
    let ll = LinkedList<String>()
    let nodeA = ll.addLast("A")
    ll.addLast("B")
    ll.addLast("C")

    // 基于节点的精确位置插入
    ll.addAfter(nodeA, "X")    // A 之后插入 X
    for (v in ll) { print("${v} ") }
    println("")  // A X B C

    // 基于节点删除
    ll.remove(nodeA)
    for (v in ll) { print("${v} ") }
    println("")  // X B C

    println("size: ${ll.size}")  // 3
}
```

### 2.4 ArrayDeque / ArrayQueue / ArrayStack

| 类型 | 接口 | 核心操作 |
|------|------|----------|
| `ArrayDeque<T>` | `Deque<T>` | `addFirst(T)`, `addLast(T)`, `removeFirst(): ?T`, `removeLast(): ?T`, `first: ?T`, `last: ?T` |
| `ArrayQueue<T>` | `Queue<T>` | `add(T)`, `remove(): ?T`, `peek(): ?T` |
| `ArrayStack<T>` | `Stack<T>` | `add(T)`, `remove(): ?T`, `peek(): ?T` |

```cangjie
package test_proj
import std.collection.*

main() {
    // 栈 — 后进先出（add=入栈，remove=出栈，peek=查看栈顶）
    let stack = ArrayStack<Int64>()
    stack.add(1)
    stack.add(2)
    stack.add(3)
    println("peek: ${stack.peek()}")    // Some(3)
    println("remove: ${stack.remove()}")  // Some(3)

    // 队列 — 先进先出（add=入队，remove=出队，peek=查看队首）
    let queue = ArrayQueue<String>()
    queue.add("first")
    queue.add("second")
    println("remove: ${queue.remove()}")  // Some(first)

    // 双端队列
    let deque = ArrayDeque<Int64>()
    deque.addFirst(1)
    deque.addLast(2)
    deque.addFirst(0)
    println("first: ${deque.first}, last: ${deque.last}")  // first: Some(0), last: Some(2)
}
```

---

## 3. 集合接口

| 接口 | 关键方法 | 说明 |
|------|----------|------|
| `Collection<T>` | `size`, `isEmpty()`, `toArray()` | 集合基础接口 |
| `List<T>` | `get(Int64)`, `set(Int64, T)`, `add(T)`, `remove(at: Int64)` | 可变列表 |
| `ReadOnlyList<T>` | `get(Int64)`, `size` | 只读列表 |
| `Map<K, V>` | `get(K)`, `add(K, V)`, `contains(K)`, `remove(K)` | 可变映射 |
| `ReadOnlyMap<K, V>` | `get(K)`, `contains(K)`, `size` | 只读映射 |
| `Set<T>` | `add(T)`, `contains(T)`, `remove(T)` | 可变集合 |
| `ReadOnlySet<T>` | `contains(T)`, `size` | 只读集合 |
| `Queue<T>` | `add(T)`, `remove(): ?T`, `peek(): ?T` | 队列 |
| `Deque<T>` | `addFirst(T)`, `addLast(T)`, `removeFirst(): ?T`, `removeLast(): ?T`, `first: ?T`, `last: ?T` | 双端队列 |
| `Stack<T>` | `add(T)`, `remove(): ?T`, `peek(): ?T` | 栈 |

---

## 4. 函数式迭代操作

所有 `Iterator<T>` 上都可以使用链式函数式操作：

### 4.1 过滤与转换

```cangjie
package test_proj
import std.collection.*

main() {
    let nums = ArrayList<Int64>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

    // filter — 过滤偶数
    let evens = collectArray<Int64>(nums.iterator().filter({n => n % 2 == 0}))
    println(evens)  // [2, 4, 6, 8, 10]

    // map — 平方
    let squares = collectArray<Int64>(nums.iterator().map({n => n * n}))
    println(squares)  // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

    // 链式组合: 过滤偶数并求平方
    let result = collectArray<Int64>(
        nums.iterator()
            .filter({n => n % 2 == 0})
            .map({n => n * n})
    )
    println(result)  // [4, 16, 36, 64, 100]
}
```

### 4.2 聚合与查询

```cangjie
package test_proj
import std.collection.*

main() {
    let nums = ArrayList<Int64>([1, 2, 3, 4, 5])

    // fold — 求和
    let sum = nums.iterator().fold<Int64>(0, {acc, n => acc + n})
    println("sum: ${sum}")  // sum: 15

    // reduce — 求最大值
    let maxVal = nums.iterator().reduce({a, b => if (a > b) { a } else { b }})
    println("max: ${maxVal}")  // max: Some(5)

    // count
    let evenCount = nums.iterator().filter({n => n % 2 == 0}).count()
    println("even count: ${evenCount}")  // even count: 2

    // any / all
    let hasEven = nums.iterator().any({n => n % 2 == 0})
    let allPositive = nums.iterator().all({n => n > 0})
    println("hasEven: ${hasEven}, allPositive: ${allPositive}")  // true, true
}
```

### 4.3 迭代控制与收集

```cangjie
package test_proj
import std.collection.*

main() {
    let names = ArrayList<String>(["Alice", "Bob", "Charlie", "Dave", "Eve"])

    // take / skip
    let first3 = collectArray<String>(names.iterator().take(3))
    println(first3)  // [Alice, Bob, Charlie]

    // enumerate — 带索引遍历
    names.iterator().enumerate().forEach({pair =>
        let (i, name) = pair
        println("${i}: ${name}")
    })

    // zip — 配对
    let scores = [90, 85, 95, 88, 92]
    let pairs = collectArray<(String, Int64)>(names.iterator().zip(scores.iterator()))
    for (pair in pairs) {
        let (name, score) = pair
        print("${name}=${score} ")
    }
    println("")

    // collectHashMap — 收集为映射
    let nameMap = collectHashMap<String, Int64>(
        names.iterator()
            .enumerate()
            .map({pair => let (i, n) = pair; (n, i)})
    )
    println("Alice index: ${nameMap["Alice"]}")
}
```

---

## 5. 收集函数

| 函数 | 说明 |
|------|------|
| `collectArray<T>(Iterable<T>): Array<T>` | 收集为 Array |
| `collectArrayList<T>(Iterable<T>): ArrayList<T>` | 收集为 ArrayList |
| `collectHashMap<K, V>(Iterable<(K, V)>): HashMap<K, V>` | 收集为 HashMap |
| `collectHashSet<T>(Iterable<T>): HashSet<T>` | 收集为 HashSet |
| `collectString<T>(delimiter!: String): (Iterable<T>) -> String` where T <: ToString | 连接为 String |

---

## 6. 关键规则速查

1. `HashMap`/`HashSet` 要求键类型实现 `Hashable & Equatable`
2. `TreeMap`/`TreeSet` 要求键类型实现 `Comparable`
3. `operator[]` 访问不存在的键会抛异常；`get()` 返回 `Option<V>` 更安全
4. `ArrayList` 是最常用的集合，适合随机访问；`LinkedList` 适合频繁头尾操作
5. `Stack`/`Queue`/`Deque` 接口统一使用 `add`/`remove`/`peek` 方法（不是 push/pop/enqueue/dequeue）
6. `remove()`/`peek()` 返回 `?T`（Option 类型），需要解包使用
7. 构建集合时可用 `ArrayList<T>(size, initFn)` 指定初始大小和初始化函数
