# 仓颉语言集合数据结构 Skill

## 1. 概述

`std.collection` 包提供丰富的泛型集合数据结构和函数式迭代操作，是仓颉标准库中最常用的包之一。

**导入**：`import std.collection.*`

---

## 2. 集合类型

### 2.1 ArrayList — 动态数组

最常用的线性集合，基于数组实现，支持随机访问和动态扩容。

| 方法 / 属性 | 说明 |
|-------------|------|
| `ArrayList<T>()` | 创建空列表 |
| `ArrayList<T>(capacity: Int64)` | 指定初始容量 |
| `ArrayList<T>(elements: Collection<T>)` | 从集合构造 |
| `ArrayList<T>(size: Int64, initElement: (Int64) -> T)` | 指定大小和初始化函数 |
| `add(element: T): Unit` | 尾部追加 |
| `add(element: T, at!: Int64): Unit` | 指定位置插入 |
| `get(index: Int64): T` | 按索引读取 |
| `set(index: Int64, element: T): Unit` | 按索引设置 |
| `remove(at!: Int64): T` | 删除指定位置元素 |
| `size: Int64` | 当前元素数量 |
| `isEmpty(): Bool` | 是否为空 |
| `contains(element: T): Bool` | 是否包含（需 T <: Equatable） |
| `operator[](index: Int64)` | 下标访问（读/写） |
| `iterator(): Iterator<T>` | 获取迭代器 |

```cangjie
package test_proj
import std.collection.*

main() {
    let list = ArrayList<String>()
    list.add("Alice")
    list.add("Bob")
    list.add("Charlie")

    // 下标访问
    println(list[0])  // Alice

    // 迭代
    for (name in list) {
        print("${name} ")
    }
    println("")  // Alice Bob Charlie

    // 插入和删除
    list.add("Dave", at: 1)   // 在索引1插入
    list.remove(at: 2)        // 删除索引2的元素(Bob)
    println("size: ${list.size}")  // size: 3

    // 从数组构造
    let nums = ArrayList<Int64>([1, 2, 3, 4, 5])
    println(nums[2])  // 3
}
```

### 2.2 HashMap — 哈希映射

基于哈希表的键值映射，要求 `K <: Hashable & Equatable<K>`。

| 方法 / 属性 | 说明 |
|-------------|------|
| `HashMap<K, V>()` | 创建空映射 |
| `HashMap<K, V>(capacity: Int64)` | 指定初始容量 |
| `HashMap<K, V>(elements: Array<(K, V)>)` | 从键值对数组构造 |
| `add(key: K, value: V): ?V` | 添加或更新，返回旧值 |
| `get(key: K): ?V` | 获取值，不存在返回 None |
| `contains(key: K): Bool` | 判断键是否存在 |
| `remove(key: K): ?V` | 删除键值对，返回旧值 |
| `size: Int64` | 当前元素数量 |
| `operator[](key: K)` | 下标访问（读/写） |

```cangjie
package test_proj
import std.collection.*

main() {
    let map = HashMap<String, Int64>()
    map["Alice"] = 90
    map["Bob"] = 85
    map["Charlie"] = 95

    // 读取
    println(map["Alice"])  // 90

    // 安全读取
    match (map.get("Dave")) {
        case Some(score) => println("Dave: ${score}")
        case None => println("Dave not found")
    }

    // 遍历
    for ((name, score) in map) {
        print("${name}=${score} ")
    }
    println("")

    // 从数组构造
    let m2 = HashMap<String, Int64>([("x", 1), ("y", 2)])
    println("contains x: ${m2.contains("x")}")  // true
}
```

### 2.3 HashSet — 哈希集合

基于哈希表的集合，要求 `T <: Hashable & Equatable<T>`，元素不重复。

```cangjie
package test_proj
import std.collection.*

main() {
    let set = HashSet<Int64>()
    set.add(1)
    set.add(2)
    set.add(3)
    set.add(2)  // 重复元素不会添加

    println("size: ${set.size}")  // size: 3
    println("contains 2: ${set.contains(2)}")  // true

    // 集合运算
    let setA = HashSet<Int64>([1, 2, 3])
    let setB = HashSet<Int64>([2, 3, 4])
    // 遍历
    for (v in setA) {
        print("${v} ")
    }
    println("")
}
```

### 2.4 TreeMap — 有序映射

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

### 2.5 TreeSet — 有序集合

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

### 2.6 LinkedList — 双向链表

双向链表，支持高效的头尾插入删除。核心方法是 `addFirst`/`addLast`/`removeFirst`/`removeLast`，以及基于 `LinkedListNode` 的精确位置操作。

```cangjie
package test_proj
import std.collection.*

main() {
    let ll = LinkedList<String>()
    ll.addLast("A")
    ll.addLast("B")
    ll.addLast("C")

    println("size: ${ll.size}")  // 3
    for (v in ll) {
        print("${v} ")
    }
    println("")  // A B C
}
```

### 2.7 ArrayDeque / ArrayQueue / ArrayStack

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
| `collectString(Iterable<String>): String` | 连接为 String |

---

## 6. 关键规则速查

1. `HashMap`/`HashSet` 要求键类型实现 `Hashable & Equatable`
2. `TreeMap`/`TreeSet` 要求键类型实现 `Comparable`
3. `operator[]` 访问不存在的键会抛异常；`get()` 返回 `Option<V>` 更安全
4. `ArrayList` 是最常用的集合，适合随机访问；`LinkedList` 适合频繁头尾操作
5. `Stack`/`Queue`/`Deque` 接口统一使用 `add`/`remove`/`peek` 方法（不是 push/pop/enqueue/dequeue）
6. `remove()`/`peek()` 返回 `?T`（Option 类型），需要解包使用
7. 构建集合时可用 `ArrayList<T>(size, initFn)` 指定初始大小和初始化函数
