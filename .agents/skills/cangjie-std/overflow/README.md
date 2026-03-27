# 仓颉语言整数溢出处理 Skill

## 1. Option 模式（checked）

- 来自 `std.overflow.*`
- `CheckedOp<T>` 扩展接口，溢出时返回 `None`

| 方法 | 说明 |
|------|------|
| `checkedAdd(y: T): ?T` | 加法，溢出返回 None |
| `checkedSub(y: T): ?T` | 减法 |
| `checkedMul(y: T): ?T` | 乘法 |
| `checkedDiv(y: T): ?T` | 除法 |
| `checkedMod(y: T): ?T` | 取模 |
| `checkedInc(): ?T` | 自增 |
| `checkedDec(): ?T` | 自减 |
| `checkedNeg(): ?T` | 取反 |
| `checkedShl(shift: Int64): ?T` | 左移 |
| `checkedShr(shift: Int64): ?T` | 右移 |
| `checkedPow(exp: UInt64): ?T` | 幂运算 |

---

## 2. 饱和模式（saturating）

- `SaturatingOp<T>` 扩展接口，溢出时饱和到类型最大/最小值

| 方法 | 说明 |
|------|------|
| `saturatingAdd(y: T): T` | 加法，溢出饱和 |
| `saturatingSub(y: T): T` | 减法 |
| `saturatingMul(y: T): T` | 乘法 |
| `saturatingDiv(y: T): T` | 除法 |
| `saturatingInc(): T` | 自增 |
| `saturatingDec(): T` | 自减 |
| `saturatingNeg(): T` | 取反 |
| `saturatingPow(exp: UInt64): T` | 幂运算 |

---

## 3. 异常模式（throwing）

- `ThrowingOp<T>` 扩展接口，溢出时抛出 `OverflowException`

| 方法 | 说明 |
|------|------|
| `throwingAdd(y: T): T` | 加法，溢出抛异常 |
| `throwingSub(y: T): T` | 减法 |
| `throwingMul(y: T): T` | 乘法 |
| `throwingDiv(y: T): T` | 除法 |
| `throwingNeg(): T` | 取反 |
| `throwingPow(exp: UInt64): T` | 幂运算 |

- 相关异常：`OvershiftException`（移位量过大），`UndershiftException`（移位量为负）

---

## 4. 截断模式（wrapping）

- `WrappingOp<T>` 扩展接口，溢出时进行模运算（截断高位）

| 方法 | 说明 |
|------|------|
| `wrappingAdd(y: T): T` | 加法，溢出截断 |
| `wrappingSub(y: T): T` | 减法 |
| `wrappingMul(y: T): T` | 乘法 |
| `wrappingDiv(y: T): T` | 除法 |
| `wrappingNeg(): T` | 取反 |
| `wrappingPow(exp: UInt64): T` | 幂运算 |

---

## 5. 进位模式（carrying）

- `CarryingOp<T>` 扩展接口，返回 `(Bool, T)` 元组，Bool 指示是否溢出

| 方法 | 说明 |
|------|------|
| `carryingAdd(y: T): (Bool, T)` | 加法，Bool 为 true 表示溢出 |
| `borrowingSub(y: T): (Bool, T)` | 减法，Bool 为 true 表示借位 |

---

## 6. 综合示例

```cangjie
package test_proj
import std.overflow.*

main() {
    let a: Int8 = Int8.Max  // 127

    // 饱和模式：溢出饱和到最大值
    println(a.saturatingAdd(1))   // 127

    // 检查模式：溢出返回 None
    println(a.checkedAdd(1))      // None

    // 截断模式：溢出截断（回绕）
    println(a.wrappingAdd(1))     // -128

    // 异常模式：溢出抛出 OverflowException
    try {
        a.throwingAdd(1)
    } catch (e: OverflowException) {
        println("overflow caught")
    }

    // 进位模式：返回 (是否溢出, 截断结果)
    let (overflow, result) = a.carryingAdd(1)
    println("carry: overflow=${overflow}, result=${result}")
}
```

---

## 7. 关键规则速查

1. `checked` 返回 `?T`（Option 类型），需模式匹配或 `getOrThrow()` 取值
2. `saturating` 溢出时钳位到 `T.Max` 或 `T.Min`，不抛异常
3. `throwing` 溢出时抛 `OverflowException`，需 try-catch 处理
4. `wrapping` 执行模运算，等同于 C 语言无符号溢出行为
5. `carrying` 返回 `(Bool, T)` 元组，适合需要检测溢出但仍需结果的场景
6. 所有整数类型（Int8/16/32/64, UInt8/16/32/64）均支持上述扩展
