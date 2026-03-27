# 仓颉语言自动派生 Skill

## 1. @Derive 基本用法

- 来自 `std.deriving.*`
- `@Derive[InterfaceList]` 宏，自动为类型生成接口实现

| 可派生接口 | 说明 |
|-----------|------|
| `ToString` | 自动生成字符串表示 |
| `Hashable` | 自动生成哈希值计算 |
| `Equatable` | 自动生成相等比较 |
| `Comparable` | 自动生成排序比较 |

- 适用于 class、struct、enum 类型

```cangjie
package test_proj
import std.deriving.*

@Derive[ToString, Hashable, Equatable]
class Point {
    Point(let x: Int64, let y: Int64) {}
}

main() {
    let p1 = Point(1, 2)
    let p2 = Point(1, 2)
    let p3 = Point(3, 4)
    println(p1)
    println(p1 == p2)
    println(p1 == p3)
    println(p1.hashCode())
}
```

---

## 2. 字段排除与属性包含

- 默认规则：所有字段参与派生，所有属性不参与

| 注解 | 说明 |
|------|------|
| `@DeriveExclude` | 标注在字段上，排除该字段不参与派生 |
| `@DeriveInclude` | 标注在属性上，将属性纳入派生计算 |

```cangjie
package test_proj
import std.deriving.*

@Derive[ToString, Equatable]
class User {
    User(let name: String, @DeriveExclude let id: Int64) {}
}

main() {
    let u1 = User("Alice", 1)
    let u2 = User("Alice", 2)
    println(u1 == u2)
    println(u1)
}
```

---

## 3. 自定义字段顺序

- `@DeriveOrder[field1, field2, ...]` 指定字段处理顺序
- 对 `Comparable` 尤为重要：决定比较优先级

```cangjie
package test_proj
import std.deriving.*

@Derive[Comparable]
@DeriveOrder[priority, name]
class Task {
    Task(let name: String, let priority: Int64) {}
}
```

---

## 4. 约束与限制

| 约束 | 说明 |
|------|------|
| 类修饰符 | class 应为 final（不能是 open/abstract/sealed） |
| 字段可见性 | 参与派生的字段/属性必须为 public |
| 字段类型 | 参与派生的字段类型必须已实现对应接口 |
| 枚举 | enum 的每个 case 的关联值类型也需实现对应接口 |

---

## 5. 关键规则速查

1. `@Derive` 支持 `ToString`、`Hashable`、`Equatable`、`Comparable` 四种接口
2. 字段默认全部参与，属性默认不参与；用 `@DeriveExclude` / `@DeriveInclude` 调整
3. `@DeriveOrder` 控制字段处理顺序，影响 `Comparable` 的比较优先级
4. 被标注的 class 必须是 final，不能是 open/abstract/sealed
5. 参与派生的字段必须为 public 且其类型已实现对应接口
