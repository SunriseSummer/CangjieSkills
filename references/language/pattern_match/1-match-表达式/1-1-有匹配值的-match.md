<!-- cj-doc kind="guide-leaf" level="5" id="language.pattern_match.1-match-表达式.1-1-有匹配值的-match" parent="language.pattern_match.1-match-表达式" -->
# 1.1 有匹配值的 match

[← 1. match 表达式](index.md)

`match (value)` 按顺序选择首个匹配的 `case`；分支写 `case pattern => exprs`，多条语句直接换行且最后一条是分支值，不能在 `=>` 后加 `{}`；须穷举或用 `_` 兜底。

```cangjie cjtest=syntax id=syntax-40ac535660-1 form=stmt
let x = 2
// match 是表达式，可赋值给变量或直接使用
let result = match (x) {
    case 1 => "one"
    case 2 => "two"
    case _ => "other"
}
println(result)  // "two"
```

**规则：**
- `=>` 后是 **exprs**（1~N 个表达式），多个时各占一行，**不需要用 `{}` 包裹**
- 每个 case 分支的值与类型由 exprs 最后一个表达式决定，运行时匹配并执行的那个 case 分支值就是 match 表达式的值
- 变量/函数作用域从定义处到下一个 `case` 前结束
- 可用 `|` 连接多个同类模式
- 按**从上到下**顺序匹配，首个匹配执行后退出（**无穿透**）
- 须**穷举**所有可能值，否则编译错误，常用 `_` 兜底
- 非穷举枚举（`...` 构造器）须用 `_` 或绑定模式覆盖（详见[枚举](../../enum/index.md)）

```cangjie cjtest=syntax id=syntax-40ac535660-2 form=unit
main() {
    let opt: ?Int64 = 42 // Option<Int64>，枚举类型
    let result = match (opt) {
        case Some(x) => // 枚举模式
            let doubled = x * 2
            println("doubled = ${doubled}")
            doubled   // 所执行分支最后一个表达式的值，就是 match 表达式的值
        case None => 0
    }
    println(result)  // 84
}
```

```cangjie cjtest=syntax id=syntax-40ac535660-3 form=stmt
let x = 1
// ❌ 错误：case 分支不使用 {} 包裹
// match (x) {
//     case 1 => { println("one"); 1 }
// }

// ✅ 正确：直接写多行表达式
match (x) {
    case 1 =>
        println("one")
        1
    case _ => 0
}
```

## 已验证反例

有返回值的 `match` 必须覆盖选择器的全部可能值；以下程序应被 1.0.5 编译器拒绝。

```cangjie cjtest=compile id=language-non-exhaustive-match-invalid exit=1
package example

enum Choice { A | B }

func value(choice: Choice): Int64 {
    match (choice) {
        case A => 1
    }
}

main(): Int64 { value(B) }
```

```text cjtest=expect for=language-non-exhaustive-match-invalid stream=stderr match=contains
non-exhaustive patterns
```
