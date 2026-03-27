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
- `put()` 队满时阻塞，`take()` 队空时阻塞
- 适用于生产者-消费者模式

### ArrayBlockingQueue<E>

| 方法 / 属性 | 说明 |
|-------------|------|
| `ArrayBlockingQueue<E>(capacity)` | 创建固定容量队列 |
| `add(element)` | 非阻塞入队，满则抛异常 |
| `put(element)` | 阻塞入队，满则等待 |
| `poll()` | 非阻塞出队，空返回 `None` |
| `peek()` | 查看队首元素，不移除 |
| `take()` | 阻塞出队，空则等待 |
| `capacity` | 队列容量 |
| `size` | 当前元素数 |

### LinkedBlockingQueue<E>

| 方法 / 属性 | 说明 |
|-------------|------|
| `LinkedBlockingQueue<E>(capacity)` | 创建指定容量队列 |
| `put(element)` | 阻塞入队，满则等待 |
| `take()` | 阻塞出队，空则等待 |
| `capacity` | 队列容量 |
| `size` | 当前元素数 |

---

## 3. 非阻塞队列（ConcurrentLinkedQueue）

- 基于无锁算法的线程安全队列
- 无容量限制，不会阻塞
- 适合高吞吐量的生产者-消费者场景

| 方法 / 属性 | 说明 |
|-------------|------|
| `ConcurrentLinkedQueue<E>()` | 创建空队列 |
| `add(element)` | 入队，始终成功 |
| `poll()` | 出队，空返回 `None` |
| `size` | 当前元素数量（近似值） |

---

## 4. 关键规则速查

1. `ConcurrentHashMap` 的 `concurrencyLevel` 建议设置为预期并发线程数
2. `K` 必须实现 `Hashable & Equatable`
3. `ArrayBlockingQueue` 容量固定，创建后不可扩容
4. `put()` / `take()` 是阻塞操作，`add()` / `poll()` 是非阻塞操作
5. `ConcurrentLinkedQueue` 无容量限制，适合无界队列场景
6. 所有并发集合的 `size` 属性反映调用瞬间的近似值
