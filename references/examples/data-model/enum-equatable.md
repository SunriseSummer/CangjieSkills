<!-- cj-doc kind="example-leaf" level="4" id="examples.data-model.enum-equatable" parent="examples.data-model" -->
# 为枚举派生或自定义相等性

[← 值类型、枚举与模式匹配](index.md)

结构化判等使用 Derive；自定义规则则实现 Equatable，并用双层括号匹配枚举值元组。

## 已验证示例

结构化判等优先使用 `@Derive[Equatable]`；只有需要自定义规则时才手动实现两个判等操作符。手动匹配两个枚举值时使用元组表达式 `match ((this, other))`。

```cangjie cjtest=run id=examples.data-model.enum-equatable.language.enum-equatable.run form=unit timeout=20s
package enum_equatable_example

import std.deriving.*

@Derive[Equatable]
enum Color {
    | Red | Green | Blue
}

enum Switch <: Equatable<Switch> {
    | On | Off

    public operator func ==(other: Switch): Bool {
        match ((this, other)) {
            case (On, On) | (Off, Off) => true
            case _ => false
        }
    }

    public operator func !=(other: Switch): Bool {
        !(this == other)
    }
}

main(): Unit {
    println(Color.Red == Color.Red)
    println(Switch.On == Switch.On)
    println(Switch.On != Switch.Off)
}
```

预期标准输出：

```text cjtest=expect for=examples.data-model.enum-equatable.language.enum-equatable.run stream=stdout match=exact
true
true
true
```

## 已验证反例

没有派生或手动实现 `Equatable` 的枚举不能直接使用 `==`。

```cangjie cjtest=compile id=examples.data-model.enum-equatable.language.enum-equatable.invalid exit=1
package enum_equatable_invalid

enum State {
    | Ready | Stopped
}

main(): Unit {
    println(State.Ready == State.Stopped)
}
```

预期标准错误中包含：

```text cjtest=expect for=examples.data-model.enum-equatable.language.enum-equatable.invalid stream=stderr match=contains
invalid binary operator '=='
```
