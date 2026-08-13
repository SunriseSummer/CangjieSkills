<!-- cj-doc kind="example-leaf" level="4" id="examples.abstractions.generic-constraint" parent="examples.abstractions" -->
# 组合多个泛型接口约束

[← 接口、泛型与扩展](index.md)

使用 where T <: A & B 暴露实现所需能力，并在编译期拒绝不满足约束的类型。

## 已验证示例

多个接口约束以 `&` 组合，使泛型实现只能调用显式声明的能力；缺少任一能力的类型实参会在调用点被编译器拒绝。

```cangjie cjtest=run id=examples.abstractions.generic-constraint.language.generic-constraint.run form=unit timeout=20s
package generic_constraint_example

interface Named {
    func name(): String
}

interface Scored {
    func score(): Int64
}

class Entry <: Named & Scored {
    public func name(): String { "Ada" }
    public func score(): Int64 { 95 }
}

func render<T>(value: T): String where T <: Named & Scored {
    return "${value.name()}:${value.score()}"
}

main(): Unit {
    println(render(Entry()))
}
```

预期标准输出：

```text cjtest=expect for=examples.abstractions.generic-constraint.language.generic-constraint.run stream=stdout match=exact
Ada:95
```

`NameOnly` 缺少 `Scored` 能力，不能作为这里的类型实参：

```cangjie cjtest=compile id=examples.abstractions.generic-constraint.language.generic-constraint.error form=unit exit=1 timeout=20s
package generic_constraint_error

interface Named {
    func name(): String
}

interface Scored {
    func score(): Int64
}

class NameOnly <: Named {
    public func name(): String { "Ada" }
}

func render<T>(value: T): String where T <: Named & Scored {
    return "${value.name()}:${value.score()}"
}

main(): Unit {
    render(NameOnly())
}
```

预期标准错误中包含：

```text cjtest=expect for=examples.abstractions.generic-constraint.language.generic-constraint.error stream=stderr match=contains
unable to infer generic argument of this function
```
