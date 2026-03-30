# 仓颉语言排序 Skill

## 1. 基本排序

- 来自 `std.sort.*`
- `sort(arr)` — 对 `Array<T>` 排序，要求 `T <: Comparable`
- 支持 `Array<T>`、`ArrayList<T>`、`List<T>`

| 函数 | 说明 |
|------|------|
| `sort<T>(data: Array<T>)` | 默认升序排序（`T <: Comparable`） |
| `sort<T>(data: Array<T>, descending!: Bool)` | 降序排序 |

---

## 2. 自定义排序

| 函数 | 说明 |
|------|------|
| `sort<T>(data: Array<T>, by!: (T, T) -> Ordering)` | 使用比较器排序 |
| `sort<T>(data: Array<T>, lessThan!: (T, T) -> Bool)` | 使用比较函数排序 |
| `sort<T, K>(data: Array<T>, key!: (T) -> K)` | 按键提取函数排序（`K <: Comparable`） |

- 可选命名参数：`stable: Bool = false`、`descending: Bool = false`

---

## 3. 稳定排序

- `sort(arr, stable: true)` — 保持相等元素的原始顺序
- 可与 `by`、`lessThan`、`key` 组合使用

```cangjie
package test_proj
import std.sort.*
import std.collection.*

class Student <: ToString {
    public let name: String
    public let age: Int64
    public init(name: String, age: Int64) {
        this.name = name
        this.age = age
    }
    public func toString(): String {
        return "{name: ${name} age: ${age}}"
    }
}

main() {
    // 基本排序
    let a = [1, 3, 5, 2, 4]
    sort(a)
    println(a)

    // by 比较器排序
    let b = [Student("A", 8), Student("B", 7), Student("C", 3), Student("D", 4), Student("E", 6)]
    let comparator = {l: Student, r: Student => l.age.compare(r.age)}
    sort(b, by: comparator)
    println(b)

    // lessThan 降序排序
    let c = [Student("A", 8), Student("B", 7), Student("C", 3), Student("D", 4), Student("E", 6)]
    let lessThan = {l: Student, r: Student => l.age < r.age}
    sort(c, lessThan: lessThan, descending: true)
    println(c)

    // key 稳定排序
    let d = [Student("A", 8), Student("B", 7), Student("C", 7), Student("D", 4), Student("E", 7)]
    let key = {i: Student => i.age}
    sort(d, key: key, stable: true)
    println(d)
    return 0
}
```

---

## 4. 关键规则速查

1. `sort(arr)` 默认不稳定、升序，需要稳定排序须显式传 `stable: true`
2. `by` 参数接收返回 `Ordering` 的比较器
3. `lessThan` 参数接收返回 `Bool` 的比较函数
4. `key` 参数接收键提取函数，按提取值排序
5. `descending: true` 可与任意排序方式组合使用
6. 支持 `Array<T>`、`ArrayList<T>`、`List<T>` 等集合类型
