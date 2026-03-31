# 仓颉语言反射与注解

## 1. 注解

### 1.1 整数溢出注解
三种内置注解控制函数的溢出策略（只能标记于**函数声明**上，作用于函数内的整数运算和整型转换）：
- **`@OverflowThrowing`**（默认）：溢出时抛出 `ArithmeticException`。尽可能在编译时检测
- **`@OverflowWrapping`**：截断高位（模运算）
- **`@OverflowSaturating`**：饱和到类型最小/最大值

```cangjie
// @OverflowThrowing（默认策略）— 溢出抛异常，编译期可检测时直接报错
@OverflowThrowing
func safeAdd(a: Int32, b: Int32): Int32 { a + b }

// @OverflowWrapping — 高位截断
@OverflowWrapping
func wrappingMul(): Int8 {
    Int8(105) * Int8(4)  // 420 → 二进制 1_1010_0100 → 截断为 1010_0100 → -92
}

// @OverflowSaturating — 饱和到极值
@OverflowSaturating
func saturatingSub(): Int8 {
    Int8(-100) - Int8(45)  // -145 → 饱和到 Int8 最小值 -128
}

main() {
    try {
        safeAdd(Int32.Max, 1)
    } catch (e: ArithmeticException) {
        println("溢出异常: ${e}")
    }
    println(wrappingMul())    // -92
    println(saturatingSub())  // -128
}
```

#### 可能引发溢出的运算符

| 类型 | 可溢出 | 不可溢出 |
|------|--------|----------|
| 算术 | `+` `-` `*` `/` `**` | `%` |
| 自增自减 | `++` `--` | — |
| 位运算 | `<<` | `>>` `!` `&` `\|` `^` |
| 复合赋值 | `+=` `-=` `*=` `/=` `**=` `<<=` | `%=` `>>=` `&=` `\|=` `^=` |

### 1.2 测试框架注解
- `@EnsurePreparedToMock` — 为静态/顶层声明准备 mock
- 仅在 `--test`/`--mock=on` 编译时允许
- 只能应用于 lambda 表达式，且 lambda 最后一个表达式须调用待 mock 的声明
- 通常不直接使用此注解，而是使用 `std.unittest.mock` 中的标准库函数

### 1.3 自定义注解
- 通过用 `@Annotation` 标记 `class` 创建
- 类不能为 `abstract`/`open`/`sealed`，须提供至少一个 `const init`
- 使用方式：`@MyAnnotation[args]` 应用于类型、成员、构造函数、参数、属性
- 通过 `TypeInfo.of(obj).findAnnotation<T>()` 获取

```cangjie
import std.reflect.TypeInfo

// 定义自定义注解
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

@Version["1.0"]
class A {}

@Version["2.0"]
class B {}

main() {
    let objects: Array<Object> = [A(), B()]
    for (obj in objects) {
        let annOpt = TypeInfo.of(obj).findAnnotation<Version>()
        if (let Some(ann) <- annOpt) {
            println(ann.code)
        }
    }
    // 输出: 1.0  2.0
}
```

#### 规则
- 同一注解不能两次应用于同一目标
- 注解**不被**子类继承 — 子类不会获得父类的注解
- `@Annotation[target: [AnnotationKind...]]` 限制有效目标
- 参数须为 `const` 表达式
- 无参注解可省略 `[]`（如 `@Marked` 等同于 `@Marked[]`）

#### AnnotationKind — 有效目标种类
```cangjie
public enum AnnotationKind {
    | Type              // 类型声明（class/struct/enum/interface）
    | Parameter         // 函数/构造函数参数
    | Init              // 构造函数声明
    | MemberProperty    // 成员属性声明
    | MemberFunction    // 成员函数声明
    | MemberVariable    // 成员变量声明
}
```

限制示例：`@Annotation[target: [MemberFunction]]` — 该注解只能用在成员函数上

---

## 2. 反射（动态特性）

反射指程序在运行时访问、检测和修改自身状态或行为的机制。优点：灵活性高、可枚举和调用类型成员、支持运行时创建类型。缺点：性能低于直接调用，主要用于框架场景。

### 2.1 获取 TypeInfo
核心反射类型 `TypeInfo` 记录任意类型的类型信息。获取方式：

| 方法 | 说明 |
|------|------|
| `TypeInfo.of(a: Any)` | 从实例获取运行时类型信息 |
| `ClassTypeInfo.of(a: Object)` | 从对象获取 `ClassTypeInfo`（推荐使用，`TypeInfo.of(Object)` 已弃用） |
| `TypeInfo.of<T>()` | 从类型参数获取静态类型信息 |
| `TypeInfo.get(qualifiedName)` | 从限定名获取，找不到抛 `InfoNotFoundException` |

```cangjie
import std.reflect.*

class Foo {}

main() {
    let a = Foo()
    let info = TypeInfo.of(a)       // 从实例获取
    let info2 = TypeInfo.of<Foo>()  // 从类型参数获取
    println(info)   // default.Foo
    println(info2)  // default.Foo
}
```

#### `TypeInfo.get()` 限定名规则
- 完全限定格式：`"module.package.type"`（如 `"std.socket.TcpSocket"`）
- 编译器预导入类型（core 包类型和内置类型如 `Int64`、`Option`、`Iterable`）直接使用裸名
- 不能获取**未实例化**泛型类型的 TypeInfo — 必须先创建该泛型类型的实例

### 2.2 访问成员
仅 `public` 成员对反射可见。`TypeInfo` 及其子类 `ClassTypeInfo` 提供以下访问接口：

#### 访问变量
```cangjie
import std.reflect.*

public class Foo {
    public static var param1 = 20
    public var param2 = 10
}

main() {
    let obj = Foo()
    let info = TypeInfo.of(obj)
    // 访问静态变量
    let sv = info.getStaticVariable("param1")
    println((sv.getValue() as Int64).getOrThrow())  // 20
    sv.setValue(8)
    println((sv.getValue() as Int64).getOrThrow())  // 8
    // 访问实例变量
    let iv = info.getInstanceVariable("param2")
    println((iv.getValue(obj) as Int64).getOrThrow())  // 10
    iv.setValue(obj, 25)
    println((iv.getValue(obj) as Int64).getOrThrow())  // 25
}
```

#### 访问属性
```cangjie
import std.reflect.*

public class Bar {
    public let _p1: Int64 = 1
    public prop p1: Int64 { get() { _p1 } }
    public var _p2: Int64 = 2
    public mut prop p2: Int64 { get() { _p2 }; set(v) { _p2 = v } }
}

main() {
    let obj = Bar()
    let info = TypeInfo.of(obj)
    let prop1 = info.getInstanceProperty("p1")
    let prop2 = info.getInstanceProperty("p2")
    println((prop1.getValue(obj) as Int64).getOrThrow())  // 1
    println((prop2.getValue(obj) as Int64).getOrThrow())  // 2
    // isMutable() 检查属性是否可变
    if (prop2.isMutable()) { prop2.setValue(obj, 20) }
    println((prop2.getValue(obj) as Int64).getOrThrow())  // 20
}
```

#### 调用函数
```cangjie
import std.reflect.*

public class Calculator {
    public static func add(a: Int64, b: Int64): Int64 { a + b }
}

main() {
    let intInfo = TypeInfo.of<Int64>()
    let funcInfo = TypeInfo.of<Calculator>().getStaticFunction("add", intInfo, intInfo)
    let result = (funcInfo.apply(TypeInfo.of<Calculator>(), [1, 1]) as Int64).getOrThrow()
    println(result)  // 2
}
