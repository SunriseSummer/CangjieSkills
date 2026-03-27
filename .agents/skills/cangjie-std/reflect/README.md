# 仓颉语言反射 Skill

## 1. TypeInfo 获取类型信息

- 来自 `std.reflect.*`
- `TypeInfo` 是所有类型信息的基类

| 方法/属性 | 说明 |
|----------|------|
| `TypeInfo.of(instance)` | 从实例获取类型信息 |
| `name: String` | 类型简名 |
| `qualifiedName: String` | 类型全限定名 |
| `instanceFunctions` | 实例方法集合 |
| `instanceVariables` | 实例字段集合 |
| `instanceProperties` | 实例属性集合 |

```cangjie
package test_proj
import std.reflect.*

public class Foo {
    public let item = 0
    public func f() {}
}

main() {
    let a = Foo()
    let ty: TypeInfo = TypeInfo.of(a)
    println(ty.name)
    println(ty.qualifiedName)
    println(ty.instanceFunctions.size)
}
```

---

## 2. 成员信息访问

- TypeInfo 的子类提供更具体的类型信息

| 类型 | 说明 |
|------|------|
| `ClassTypeInfo` | 类类型，额外提供 `constructors` 集合 |
| `StructTypeInfo` | 结构体类型 |
| `InterfaceTypeInfo` | 接口类型 |
| `PrimitiveTypeInfo` | 基本类型 |
| `GenericTypeInfo` | 泛型类型 |

- 成员信息类型：

| 类型 | 说明 |
|------|------|
| `ConstructorInfo` | 构造函数信息 |
| `InstanceFunctionInfo` | 实例方法信息 |
| `InstanceVariableInfo` | 实例字段信息 |
| `InstancePropertyInfo` | 实例属性信息 |

---

## 3. 动态调用

- 通过 `ConstructorInfo` 动态创建实例
- 通过 `InstanceFunctionInfo` 动态调用方法
- 通过 `InstanceVariableInfo` 动态读写字段
- 通过 `InstancePropertyInfo` 动态读写属性
- **限制**：仅支持 public 成员，macOS 平台不支持反射

---

## 4. 异常类型

| 异常 | 说明 |
|------|------|
| `ReflectException` | 反射操作基础异常 |
| `IllegalSetException` | 非法赋值（如设置只读字段） |
| `IllegalTypeException` | 类型不匹配 |
| `InfoNotFoundException` | 找不到指定成员信息 |
| `InvocationTargetException` | 动态调用目标方法抛出异常 |
| `MisMatchException` | 参数不匹配 |

---

## 5. 关键规则速查

1. `TypeInfo.of(instance)` 获取运行时类型信息，是反射入口
2. 仅 public 成员可通过反射访问
3. macOS 平台不支持反射功能
4. 动态调用时参数类型和数量必须匹配，否则抛 `MisMatchException`
5. 通过 `ClassTypeInfo` 的 `constructors` 可动态创建实例
6. 反射获取的集合（functions/variables/properties）均为只读
