<!-- cj-doc kind="example-leaf" level="4" id="examples.functions.closure-state" parent="examples.functions" -->
# 为可逃逸闭包封装可变状态

[← 函数、闭包与运算符](index.md)

捕获 let 绑定的引用对象以安全保存状态，并识别局部 var 不能随闭包逃逸的限制。

## 已验证示例

捕获 `let` 绑定的引用对象可以逃逸，并可修改对象内部状态；直接捕获局部 `var` 的闭包则只能立即调用，不能返回或保存。

```cangjie cjtest=run id=examples.functions.closure-state.language.closure-state.run form=unit timeout=20s
package closure_state_example

func makeCounter(start: Int64): () -> Int64 {
    let state = CounterState(start)
    return { =>
        state.current += 1
        state.current
    }
}

class CounterState {
    var current: Int64

    public init(current: Int64) {
        this.current = current
    }
}

main(): Unit {
    let next = makeCounter(40)
    println(next())
    println(next())
}
```

预期标准输出：

```text cjtest=expect for=examples.functions.closure-state.language.closure-state.run stream=stdout match=exact
41
42
```

下面的闭包直接捕获局部 `var` 并试图逃逸，编译器会拒绝：

```cangjie cjtest=compile id=examples.functions.closure-state.language.closure-mutable-escape.error form=unit exit=1 timeout=20s
package closure_mutable_escape_error

func invalidCounter(start: Int64): () -> Int64 {
    var current = start
    return { =>
        current += 1
        current
    }
}

main(): Unit {}
```

预期标准错误中包含：

```text cjtest=expect for=examples.functions.closure-state.language.closure-mutable-escape.error stream=stderr match=contains
lambda capturing mutable variables needs to be called directly
```
