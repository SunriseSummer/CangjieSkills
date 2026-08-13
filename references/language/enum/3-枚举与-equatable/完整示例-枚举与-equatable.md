<!-- cj-doc kind="guide-leaf" level="5" id="language.enum.3-枚举与-equatable.完整示例-枚举与-equatable" parent="language.enum.3-枚举与-equatable" -->
# 完整示例：枚举与 Equatable

[← 3. 枚举与 Equatable](index.md)

结构化判等优先用 `@Derive[Equatable]`；自定义判等时显式实现 `==` 和 `!=`。

```cangjie cjtest=syntax id=syntax-02bcbd80d7-1 form=unit
import std.deriving.*

@Derive[Equatable]
enum Color {
    | Red | Green | Blue
}

main() {
    let c = Color.Red

    // 使用 @Derive 实现 Equatable 接口后可直接用 == 比较
    if (c == Color.Red) {
        println("It's red!")
    }
}
```

## 已验证示例

结构化判等优先使用 `@Derive[Equatable]`；只有需要自定义规则时才手动实现两个判等操作符。手动匹配两个枚举值时使用元组表达式 `match ((this, other))`。

```cangjie cjtest=run id=language.enum-equatable.run form=unit timeout=20s
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

```text cjtest=expect for=language.enum-equatable.run stream=stdout match=exact
true
true
true
```

## 已验证反例

没有派生或手动实现 `Equatable` 的枚举不能直接使用 `==`。

```cangjie cjtest=compile id=language.enum-equatable.invalid exit=1
package enum_equatable_invalid

enum State {
    | Ready | Stopped
}

main(): Unit {
    println(State.Ready == State.Stopped)
}
```

```text cjtest=expect for=language.enum-equatable.invalid stream=stderr match=contains
invalid binary operator '=='
```
