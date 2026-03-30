# 仓颉语言弱引用 Skill

## 1. 概述

`std.ref` 包提供弱引用（WeakRef）能力。弱引用不会阻止 GC 回收对象，适用于缓存、对象池等场景。

**导入**：`import std.ref.*`

---

## 2. WeakRef

| 方法 / 属性 | 说明 |
|-------------|------|
| `WeakRef<T>(value: T, cleanupPolicy: CleanupPolicy)` | 创建弱引用（T <: Object） |
| `value: ?T` | 读取弱引用对象，已回收则返回 `None` |
| `cleanupPolicy: CleanupPolicy` | 获取清理策略 |
| `clear(): Unit` | 强制清除弱引用，后续 `value` 返回 `None` |

### CleanupPolicy 枚举

| 值 | 说明 |
|------|------|
| `EAGER` | 激进回收 — GC 尽快回收弱引用对象 |
| `DEFERRED` | 延迟回收 — GC 尽量晚回收（如内存不足时） |

---

## 3. 使用示例

```cangjie
package test_proj
import std.ref.*

class MyResource {
    let name: String
    init(name: String) {
        this.name = name
    }
}

main() {
    let obj = MyResource("test")

    // 创建弱引用
    let weakRef = WeakRef<MyResource>(obj, EAGER)

    // 读取弱引用
    match (weakRef.value) {
        case Some(r) => println("alive: ${r.name}")  // alive: test
        case None => println("collected")
    }

    // 手动清除
    weakRef.clear()
    println("after clear: ${weakRef.value.isNone()}")  // true
}
```

---

## 4. 缓存场景示例

```cangjie
package test_proj
import std.ref.*
import std.collection.*

class ExpensiveData {
    let id: Int64
    init(id: Int64) {
        this.id = id
    }
}

// 弱引用缓存：对象不被其他地方引用时可被 GC 回收
class WeakCache {
    let cache = HashMap<Int64, WeakRef<ExpensiveData>>()

    func put(key: Int64, value: ExpensiveData): Unit {
        cache[key] = WeakRef<ExpensiveData>(value, DEFERRED)
    }

    func get(key: Int64): ?ExpensiveData {
        match (cache.get(key)) {
            case Some(wr) => wr.value
            case None => None
        }
    }
}

main() {
    let cache = WeakCache()
    let data = ExpensiveData(1)
    cache.put(1, data)

    match (cache.get(1)) {
        case Some(d) => println("cached id: ${d.id}")
        case None => println("not cached")
    }
}
```

---

## 5. 关键规则速查

1. `WeakRef<T>` 要求 `T <: Object`（引用类型），不能用于 struct/enum
2. `value` 返回 `?T`，访问前必须判断是否为 `None`
3. `EAGER` 策略适合临时缓存，`DEFERRED` 适合希望尽量保留的缓存
4. 弱引用不增加对象的引用计数，不会阻止 GC 回收
5. `clear()` 立即使弱引用失效，不会影响原对象的生命周期
