# 仓颉语言并发安全集合 Skill

## 1. ConcurrentHashMap<K, V>

- 来自 `std.collection.concurrent.*`
- 线程安全的哈希映射，`K` 需实现 `Hashable & Equatable`
- `concurrencyLevel` 控制内部分段数，影响并发写入性能
- 实现 `ConcurrentMap<K, V>` 接口

| 方法 / 属性 | 说明 |
|-------------|------|
| `ConcurrentHashMap<K, V>(concurrencyLevel: n)` | 创建实例，指定并发级别 |
| `put(key, value)` | 插入或更新键值对 |
| `get(key)` | 获取值，返回 `Option<V>` |
| `remove(key)` | 删除键值对 |
| `containsKey(key)` | 判断键是否存在 |
| `size` | 当前元素数量 |

```cangjie
package test_proj
import std.collection.concurrent.*
import std.sync.*

main(): Int64 {
    let cmap = ConcurrentHashMap<Int64, Int64>(concurrencyLevel: 64)
    let threads = 8
    let M = 1024
    // 使用 Future 数组管理并发任务
    let jobs = Array<Future<Unit>>(threads, repeat: unsafe { zeroValue<Future<Unit>>() })
    for (t in 0..threads) {
        jobs[t] = spawn {
            for (i in t..M : threads) {
                cmap.put(i, i + 3)
            }
        }
    }
    for (t in 0..threads) {
        jobs[t].get()
    }
    println("Size: ${cmap.size}")
    return 0
}
```

---

## 2. 阻塞队列（ArrayBlockingQueue / LinkedBlockingQueue）

- **ArrayBlockingQueue<E>**：固定容量阻塞队列，基于数组实现
- **LinkedBlockingQueue<E>**：可选容量阻塞队列，基于链表实现
- `add()` 队满时阻塞，`remove()` 队空时阻塞
- 适用于生产者-消费者模式

### ArrayBlockingQueue<E>

| 方法 / 属性 | 说明 |
|-------------|------|
| `ArrayBlockingQueue<E>(capacity)` | 创建固定容量队列 |
| `add(element)` | 阻塞入队，满则等待 |
| `add(element, timeout)` | 阻塞入队，超时返回 `false` |
| `tryAdd(element)` | 非阻塞入队，满则返回 `false` |
| `remove()` | 阻塞出队，空则等待，返回 `Option<E>` |
| `remove(timeout)` | 阻塞出队，超时返回 `None` |
| `tryRemove()` | 非阻塞出队，空返回 `None` |
| `peek()` | 查看队首元素，不移除 |
| `capacity` | 队列容量 |
| `size` | 当前元素数 |

### LinkedBlockingQueue<E>

| 方法 / 属性 | 说明 |
|-------------|------|
| `LinkedBlockingQueue<E>(capacity)` | 创建指定容量队列 |
| `add(element)` | 阻塞入队，满则等待 |
| `tryAdd(element)` | 非阻塞入队，满则返回 `false` |
| `remove()` | 阻塞出队，空则等待 |
| `tryRemove()` | 非阻塞出队，空返回 `None` |
| `capacity` | 队列容量 |
| `size` | 当前元素数 |

```cangjie
package test_proj
import std.collection.concurrent.*
import std.sync.*

main(): Int64 {
    // ArrayBlockingQueue: 固定容量的生产者-消费者模式
    let queue = ArrayBlockingQueue<Int64>(10)
    let done = SyncCounter(1)

    // 生产者（阻塞入队）
    spawn {
        for (i in 0..5) {
            queue.add(i)
        }
        done.dec()
    }

    done.waitUntilZero()

    // 消费者（非阻塞出队）
    while (true) {
        match (queue.tryRemove()) {
            case Some(v) => print("${v} ")
            case None => break
        }
    }
    println("")  // 输出: 0 1 2 3 4
    return 0
}
```

---

## 3. 非阻塞队列（ConcurrentLinkedQueue）

- 基于无锁算法的线程安全队列
- 无容量限制，不会阻塞
- 适合高吞吐量的生产者-消费者场景

| 方法 / 属性 | 说明 |
|-------------|------|
| `ConcurrentLinkedQueue<E>()` | 创建空队列 |
| `add(element)` | 入队，始终成功 |
| `remove()` | 出队，返回 `Option<E>`，空返回 `None` |
| `peek()` | 查看队首元素，不移除，返回 `Option<E>` |
| `isEmpty()` | 是否为空 |
| `size` | 当前元素数量（近似值） |

```cangjie
package test_proj
import std.collection.concurrent.*

main(): Int64 {
    let queue = ConcurrentLinkedQueue<String>()
    queue.add("A")
    queue.add("B")
    queue.add("C")

    println("size: ${queue.size}")           // size: 3
    println("peek: ${queue.peek()}")         // peek: Some(A)
    println("remove: ${queue.remove()}")     // remove: Some(A)
    println("size: ${queue.size}")           // size: 2
    return 0
}
```

---

## 4. 关键规则速查

1. `ConcurrentHashMap` 的 `concurrencyLevel` 建议设置为预期并发线程数
2. `K` 必须实现 `Hashable & Equatable`
3. `ArrayBlockingQueue` 容量固定，创建后不可扩容
4. 阻塞队列的 `add()` / `remove()` 是阻塞操作，`tryAdd()` / `tryRemove()` 是非阻塞操作
5. `ConcurrentLinkedQueue` 无容量限制，所有操作（`add` / `remove` / `peek`）均为非阻塞
6. 所有并发集合的 `size` 属性反映调用瞬间的近似值
