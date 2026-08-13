<!-- cj-doc kind="example-leaf" level="4" id="examples.abstractions.custom-iterator" parent="examples.abstractions" -->
# 实现 Iterable 与 Iterator

[← 接口、泛型与扩展](index.md)

实现 iterator/next 契约，让自定义类型自然参与 for-in。

## 已验证示例

自定义容器实现 `Iterable<T>.iterator()`，迭代器实现 `Iterator<T>.next()`；`for-in` 会持续取值直至返回 `None`。

```cangjie cjtest=run id=examples.abstractions.custom-iterator.language.custom-iterable.run form=unit timeout=20s
package custom_iterable_example

class CountdownIterator <: Iterator<Int64> {
    var current: Int64

    public init(start: Int64) {
        current = start
    }

    public func next(): ?Int64 {
        if (current <= 0) {
            return None
        }
        let value = current
        current -= 1
        return Some(value)
    }
}

class Countdown <: Iterable<Int64> {
    let start: Int64

    public init(start: Int64) {
        this.start = start
    }

    public func iterator(): Iterator<Int64> {
        return CountdownIterator(start)
    }
}

main(): Unit {
    for (value in Countdown(3)) {
        println(value)
    }
}
```

预期标准输出：

```text cjtest=expect for=examples.abstractions.custom-iterator.language.custom-iterable.run stream=stdout match=exact
3
2
1
```
