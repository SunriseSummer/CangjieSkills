<!-- cj-doc kind="guide-leaf" level="5" id="language.pattern_match.4-其他模式匹配语法-场景.4-2-if-let-条件匹配" parent="language.pattern_match.4-其他模式匹配语法-场景" -->
# 4.2 if-let 条件匹配

[← 4. 其他模式匹配语法/场景](index.md)

在 `if` 条件中使用 `let pattern <- expression` 语法糖，匹配成功进入 `if` 分支，绑定变量**仅在 `if` 分支内可用**。`<-` 右侧表达式优先级不能低于 `..`，必要时用 `()` 包裹。

### 基本用法

```cangjie cjtest=syntax id=syntax-0bff624189-1 form=unit
enum Msg {
    | Text(String) | Quit
}

main() {
    let m: Msg = Text("hello")
    if (let Text(s) <- m) {
        println(s)           // hello
    } else {
        println("not text")
    }
}
```

### 多条件组合（`&&`）

`&&` 可连接多个 `let` 模式或与布尔表达式混合，前面绑定的变量可在后续条件中使用：

```cangjie cjtest=syntax id=syntax-0bff624189-2 form=unit
enum Expr {
    | Num(Int64) | Error
}

main() {
    let a = Num(42)
    let b = Num(10)

    // 两个 let 模式同时匹配
    if (let Num(x) <- a && let Num(y) <- b) {
        println("sum = ${x + y}")  // sum = 52
    }

    // let 模式 + 布尔条件
    if (let Num(n) <- a && n > 0) {
        println("positive: ${n}")  // positive: 42
    }
}
```

### 或条件（`||`）

`||` 连接时，模式中**不能有变量绑定**，只能使用通配符 `_`：

```cangjie cjtest=run id=language.pattern-match.if-let-or.run form=unit timeout=30s
package pattern_match_if_let_or_example

enum Expr { | Num(Int64) | Err }

func hasNum(first: Expr, second: Expr): Bool {
    if (let Num(_) <- first || let Num(_) <- second) {
        true
    } else {
        false
    }
}

main(): Unit {
    let left: Expr = Err
    let right = Num(1)
    if (hasNum(left, right)) {
        println("至少一个是 Num")
    }

    let other: Expr = Err
    if (hasNum(left, other)) {
        println("不会执行")
    } else {
        println("都不是 Num")
    }
}
```

```text cjtest=expect for=language.pattern-match.if-let-or.run stream=stdout match=exact
至少一个是 Num
都不是 Num
```

### 限制与常见错误

- `||` 连接的模式不能绑定变量
- `&&` 右侧须为 `let pattern` 或 `Bool` 表达式
- 绑定变量不能在绑定它的 `let` 左侧使用
- 绑定变量不能在 `else` 分支使用
- 条件中使用 `&&` 做额外检查，**不用 `where`**（`where` 仅用于 match 模式守卫）

```cangjie cjtest=syntax id=syntax-0bff624189-4 form=stmt
// ❌ 错误示例
// if (let Num(a) <- x || a > 1) {}     // || 连接的模式不能绑定变量
// if (a > 3 && let Num(a) <- x) {}     // a 在绑定前使用
// if (let Num(a) <- x where a > 3) {}  // 应使用 && 而非 where
// if (let Num(a) <- x && a > 0) {
//     println(a)
// } else {
//     println(a)  // ❌ a 不能在 else 分支使用
// }
```
