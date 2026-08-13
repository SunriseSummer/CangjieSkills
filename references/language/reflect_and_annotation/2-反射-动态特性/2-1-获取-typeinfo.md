<!-- cj-doc kind="guide-leaf" level="5" id="language.reflect_and_annotation.2-反射-动态特性.2-1-获取-typeinfo" parent="language.reflect_and_annotation.2-反射-动态特性" -->
# 2.1 获取 TypeInfo

[← 2. 反射（动态特性）](index.md)

核心反射类型 `TypeInfo` 记录任意类型的类型信息。获取方式：

| 方法 | 说明 |
|------|------|
| `ClassTypeInfo.of(a: Object)` | 从对象获取 `ClassTypeInfo`（推荐） |
| `TypeInfo.of<T>()` | 从类型参数获取静态类型信息 |
| `TypeInfo.get(qualifiedName)` | 从限定名获取，找不到抛 `InfoNotFoundException` |

```cangjie cjtest=syntax id=syntax-ea18b2fea5-1 form=unit
import std.reflect.*

class Foo {}

main() {
    let a = Foo()
    let info = ClassTypeInfo.of(a)  // 从对象获取（推荐）
    let info2 = TypeInfo.of<Foo>()  // 从类型参数获取
    println(info)   // default.Foo
    println(info2)  // default.Foo
}
```

### `TypeInfo.get()` 限定名规则
- 完全限定格式：`"module.package.type"`（如 `"std.socket.TcpSocket"`）
- 编译器预导入类型（core 包类型和内置类型如 `Int64`、`Option`、`Iterable`）直接使用裸名
- 不能获取**未实例化**泛型类型的 TypeInfo — 泛型类型必须指定具体类型参数且该具体类型在运行时已被实例化过
