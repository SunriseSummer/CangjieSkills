# 仓颉语言集合框架 Skill

## 1. ArrayList<T>

- 来自 `import std.collection.*`
- 可变长数组，支持下标访问、增删改查、切片

| 构造方式 | 说明 |
|---------|------|
| `ArrayList<Int64>()` | 空列表 |
| `ArrayList<Int64>(10)` | 指定初始容量 |
| `ArrayList<Int64>([1, 2, 3])` | 从数组构造 |

| 方法/属性 | 说明 |
|----------|------|
| `add(element)` | 尾部添加元素 |
| `add(element, at: index)` | 在指定位置插入 |
| `add(all: array)` | 追加数组所有元素 |
| `add(all: array, at: index)` | 在指定位置插入数组所有元素 |
| `get(index): ?T` | 获取元素，返回 Option 类型 |
| `list[index]` / `list[index] = value` | 下标读写 |
| `remove(at: index)` | 删除指定位置元素 |
| `clear()` | 清空列表 |
| `slice(range)` | 获取子列表 |
| `size` | 元素数量 |

- 支持 `for-in` 迭代

```cangjie
package test_proj
import std.collection.*

main(): Int64 {
    var list: ArrayList<Int64> = ArrayList<Int64>(10)
    var arr: Array<Int64> = [1, 2, 3]
    list.add(all: arr)
    // 下标赋值
    list[1] = 120
    var b = list.get(2)
    print("b=${b.getOrThrow()},")
    // 指定位置插入
    list.add(12, at: 1)
    var c = list.get(2)
    print("c=${c.getOrThrow()},")
    // 在指定位置插入数组
    var arr1: Array<Int64> = [1, 2, 3]
    list.add(all: arr1, at: 1)
    var d = list.get(2)
    print("d=${d.getOrThrow()}")
    return 0
}
```

---

## 2. HashMap<K, V>

- K 需实现 `Hashable & Equatable<K>`
- 无序键值对集合

| 方法 | 说明 |
|------|------|
| `HashMap<String, Int64>()` | 构造空映射 |
| `add(key, value)` | 添加键值对 |
| `add(all: array)` | 从元组数组批量添加 |
| `get(key): ?V` | 获取值，返回 Option 类型 |
| `contains(key): Bool` | 检查键是否存在 |
| `remove(key)` | 删除键值对 |
| `clear()` | 清空映射 |

```cangjie
package test_proj
import std.collection.*

main(): Int64 {
    var map: HashMap<String, Int64> = HashMap<String, Int64>()
    map.add("a", 13)
    print("a=${map.get("a").getOrThrow()} ")
    // 从元组数组批量添加
    var arr: Array<(String, Int64)> = [("d", 11), ("e", 12)]
    map.add(all: arr)
    map.remove("d")
    var bool = map.contains("d")
    print("bool=${bool.toString()}")
    return 0
}
```

---

## 3. HashSet<T> 与 TreeSet<T>

- `HashSet<T>`：无序集合，T 需实现 `Hashable & Equatable<T>`
- `TreeSet<T>`：有序集合，T 需实现 `Comparable<T>`，迭代按排序输出
- `TreeMap<K, V>`：有序映射，K 需实现 `Comparable<K>`，接口同 HashMap

| 方法 | 说明 |
|------|------|
| `add(element)` | 添加元素 |
| `contains(element): Bool` | 检查是否包含 |
| `remove(element)` | 删除元素 |

- 支持 `for-in` 迭代

```cangjie
package test_proj
import std.collection.*

main(): Int64 {
    var set: TreeSet<String> = TreeSet<String>()
    set.add("peach")
    set.add("banana")
    set.add("apple")
    set.add("orange")
    // TreeSet 按排序顺序迭代
    for (e in set) {
        println(e)
    }
    set.remove("banana")
    println(set)
    return 0
}
```

---

## 4. 函数式迭代操作（管道操作符）

- 使用 `|>` 管道操作符对可迭代对象进行链式函数式处理

| 操作 | 说明 |
|------|------|
| `filter { predicate }` | 过滤元素 |
| `map { transform }` | 变换元素 |
| `forEach<T>(action)` | 对每个元素执行操作 |
| `step<T>(n)` | 每隔 n 个取一个元素 |
| `skip<T>(n)` | 跳过前 n 个元素 |
| `contains(value)` | 检查是否包含 |
| `collectString<T>(delimiter: str)` | 拼接为字符串 |
| `collectArrayList<T>()` | 收集为 ArrayList |
| `collectArray<T>()` | 收集为 Array |

```cangjie
package test_proj
import std.collection.*

main(): Int64 {
    let arr = [-1, 2, 3, 4, 5, 6, 7, 8, 9]
    // 管道操作：过滤 -> 步进 -> 跳过 -> 遍历
    arr |> filter {a: Int64 => a > 0} |>
        step<Int64>(2) |>
        skip<Int64>(2) |>
        forEach<Int64>(println)
    // 收集为字符串
    let str = arr |> filter {a: Int64 => a % 2 == 1} |> collectString<Int64>(delimiter: ">")
    println(str)
    return 0
}
```

---

## 5. 关键接口

| 接口 | 说明 |
|------|------|
| `List<T>` | 有序可索引集合（ArrayList 实现） |
| `Map<K, V>` | 键值对映射（HashMap、TreeMap 实现） |
| `Set<T>` | 不重复元素集合（HashSet、TreeSet 实现） |
| `Deque<T>` | 双端队列 |
| `Queue<T>` | 先进先出队列 |
| `Stack<T>` | 后进先出栈 |

---

## 6. 异常类型

| 异常 | 说明 |
|------|------|
| `ConcurrentModificationException` | 迭代过程中修改集合时抛出 |

---

## 7. 关键规则速查

1. `get(index)` / `get(key)` 返回 `?T`（Option 类型），使用 `.getOrThrow()` 解包
2. HashMap/HashSet 的键/元素需实现 `Hashable & Equatable`
3. TreeMap/TreeSet 的键/元素需实现 `Comparable`，迭代按排序顺序
4. 管道操作符 `|>` 的 lambda 参数需标注类型，如 `{a: Int64 => a > 0}`
5. 管道函数如 `step`、`skip`、`collectArray` 等需显式指定泛型参数
6. 迭代过程中不可修改集合，否则抛出 `ConcurrentModificationException`
7. ArrayList 支持下标读写 `list[i]` 和 `list[i] = value`
