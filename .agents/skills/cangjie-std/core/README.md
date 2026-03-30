# 仓颉语言核心包 Skill

## 1. 概述

`std.core` 是仓颉标准库的核心包，**自动导入**，无需显式 `import`。它包含基本类型、核心接口、全局函数、异常体系、Duration、并发原语等。

---

## 2. 基本类型

| 类型 | 说明 |
|------|------|
| `Int8`/`Int16`/`Int32`/`Int64` | 有符号整数（`Int` = `Int64`） |
| `UInt8`/`UInt16`/`UInt32`/`UInt64` | 无符号整数（`Byte` = `UInt8`，`UInt` = `UInt64`） |
| `Float16`/`Float32`/`Float64` | 浮点数 |
| `Bool` | `true` / `false` |
| `Unit` | 无返回值 |
| `Rune` | Unicode 字符（用单引号 `'a'`） |
| `String` | UTF-8 字符串 |
| `Array<T>` | 固定长度数组 |
| `Range<T>` | 区间范围 |
| `Option<T>` | 可空类型，`Some(T)` / `None`，语法糖 `?T` |
| `Ordering` | 比较结果：`LT` / `EQ` / `GT` |

---

## 3. String 常用方法

```cangjie
main() {
    let s = "Hello, 仓颉!"

    // 基本属性
    println(s.size)             // 字节长度
    println(s.isEmpty())        // false

    // 查找
    println(s.contains("仓颉"))  // true
    println(s.startsWith("Hello"))  // true
    println(s.indexOf(","))     // Some(5)

    // 分割与替换
    let parts = "a,b,c".split(",")
    println(parts)  // [a, b, c]
    println("hello world".replace("world", "仓颉"))  // hello 仓颉

    // 去除空白与填充
    println("  hello  ".trimAscii())  // "hello"
    println("42".padStart(6, padding: "0"))  // "000042"

    // 大小写
    println("Hello".toAsciiUpper())  // "HELLO"
    println("Hello".toAsciiLower())  // "hello"

    // 重复
    println("ab" * 3)  // "ababab"
}
```

---

## 4. Option 使用

```cangjie
main() {
    let x: ?Int64 = Some(42)
    let y: ?Int64 = None

    // 判断
    println(x.isSome())  // true
    println(y.isNone())  // true

    // 解包
    println(x.getOrThrow())  // 42
    println(y.getOrDefault({=> 0}))  // 0

    // ?? 运算符提供默认值
    let val = y ?? 99
    println(val)  // 99

    // if-let 模式匹配
    if (let Some(v) <- x) {
        println("value: ${v}")
    }
}
```

---

## 5. StringBuilder

用于高效拼接字符串，避免大量 `+` 操作产生的中间字符串。

```cangjie
main() {
    let sb = StringBuilder()
    sb.append("Hello")
    sb.append(", ")
    sb.append("World!")
    sb.append(" count=")
    sb.append(42)
    println(sb.toString())  // Hello, World! count=42
}
```

---

## 6. 核心接口

| 接口 | 关键方法 | 说明 |
|------|----------|------|
| `Any` | — | 所有类型的顶层接口 |
| `ToString` | `toString(): String` | 字符串表示 |
| `Hashable` | `hashCode(): Int64` | 哈希值计算 |
| `Equatable<T>` | `==(T): Bool`, `!=(T): Bool` | 相等比较 |
| `Comparable<T>` | `compare(T): Ordering` | 大小比较（自动推导 `<`/`>`/`<=`/`>=`） |
| `Iterable<E>` | `iterator(): Iterator<E>` | 支持 for-in 迭代 |
| `Collection<T>` | `size`, `isEmpty()`, `toArray()` | 集合基础接口 |
| `Resource` | `isClosed(): Bool`, `close()` | try-with-resources 自动关闭 |
| `Countable<T>` | `next(Int64): T`, `position(): Int64` | 可计数类型（用于 Range） |

---

## 7. 全局函数

### 7.1 I/O 函数（无需导入）

```cangjie
main() {
    // 输出
    print("不换行")
    println("换行输出")
    println("${1 + 2}")  // 字符串插值: 3

    // 错误输出
    eprintln("输出到 stderr")
}
```

### 7.2 数学函数

```cangjie
main() {
    let a: Int64 = 3
    let b: Int64 = 7
    println(min(a, b))   // 3
    println(max(a, b))   // 7
}
```

### 7.3 并发函数

```cangjie
main() {
    // spawn — 创建新线程，返回 Future<T>
    let f = spawn {
        42
    }
    println(f.get())  // 42（阻塞等待结果）

    // sleep — 休眠
    sleep(Duration.millisecond * 10)
}
```

### 7.4 工具函数

| 函数 | 说明 |
|------|------|
| `refEq(Object, Object): Bool` | 引用相等比较 |
| `sizeOf<T>(): Int64` | 获取类型大小 |
| `alignOf<T>(): Int64` | 获取类型对齐 |
| `zeroValue<T>(): T` | 获取类型零值（`unsafe` 上下文） |

---

## 8. Duration — 时间间隔

```cangjie
main() {
    // 构造
    let d1 = Duration.second * 5
    let d2 = Duration.millisecond * 500
    let d3 = Duration.minute * 2
    let d4 = Duration.hour

    // 运算
    let total = d1 + d2
    println(total)  // 打印时间间隔

    // 比较
    println(d1 > d2)  // true

    // 常用单位
    // Duration.nanosecond / Duration.microsecond / Duration.millisecond
    // Duration.second / Duration.minute / Duration.hour
}
```

---

## 9. 异常体系

### 9.1 Error（系统错误，不应捕获）

| 异常 | 说明 |
|------|------|
| `OutOfMemoryError` | 内存不足 |
| `StackOverflowError` | 栈溢出 |

### 9.2 Exception（可捕获处理）

| 异常 | 说明 |
|------|------|
| `ArithmeticException` | 算术错误（除零等） |
| `IllegalArgumentException` | 非法参数 |
| `IndexOutOfBoundsException` | 索引越界 |
| `NoneValueException` | 访问 None 值 |
| `OverflowException` | 溢出 |
| `TimeoutException` | 超时 |
| `IllegalStateException` | 非法状态 |
| `UnsupportedException` | 不支持的操作 |

### 9.3 异常处理

```cangjie
main() {
    // try-catch
    try {
        let x: ?Int64 = None
        println(x.getOrThrow())
    } catch (e: NoneValueException) {
        println("caught: ${e}")
    }

    // try-with-resource（自动关闭 Resource）
    // try (f = File("path", Read)) { ... }
}
```

---

## 10. 并发原语

| 类型 | 说明 |
|------|------|
| `Future<T>` | spawn 表达式返回值，`get(): T` 阻塞等待结果 |
| `Thread` | 线程信息，`Thread.currentThread` 获取当前线程 |
| `ThreadLocal<T>` | 线程本地存储 |

---

## 11. 其他核心类型

| 类型 | 说明 |
|------|------|
| `Box<T>` | 值类型装箱为引用类型 |
| `Object` | 所有 class 的基类 |
| `DefaultHasher` | 默认哈希计算器 |
| `CString` | C 字符串包装（用于 FFI） |
| `CPointer<T>` | C 指针包装（用于 FFI） |

---

## 12. 关键规则速查

1. `std.core` 自动导入，无需 `import`
2. `Option<T>` 用 `??` 提供默认值，`?.` 安全链式调用
3. 字符串插值使用 `"${expr}"` 语法
4. `spawn { }` 创建线程返回 `Future<T>`，`Future.get()` 阻塞等待
5. `try-with-resource` 自动关闭实现了 `Resource` 接口的对象
6. 异常处理使用 `try { } catch (e: ExceptionType) { }`
7. `StringBuilder` 适用于大量字符串拼接场景
8. Duration 通过 `Duration.second * n` 构造，支持算术运算
