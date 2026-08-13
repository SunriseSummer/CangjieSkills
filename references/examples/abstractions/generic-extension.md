<!-- cj-doc kind="example-leaf" level="4" id="examples.abstractions.generic-extension" parent="examples.abstractions" -->
# 区分具体类型与泛型扩展

[← 接口、泛型与扩展](index.md)

只为特化类型添加专属成员，同时为全部 Box<T> 提供通用扩展。

## 已验证示例

具体类型扩展只为 `Box<Int64>` 提供 `doubled`；泛型扩展则为每个 `Box<T>` 提供 `get`。

```cangjie cjtest=run id=examples.abstractions.generic-extension.language.generic-extension.run form=unit timeout=20s
package generic_extension_example

class Box<T> {
    let value: T

    public init(value: T) {
        this.value = value
    }
}

extend Box<Int64> {
    public func doubled(): Int64 {
        return value * 2
    }
}

extend<T> Box<T> {
    public func get(): T {
        return value
    }
}

main(): Unit {
    println(Box<Int64>(21).doubled())
    println(Box<String>("generic").get())
}
```

预期标准输出：

```text cjtest=expect for=examples.abstractions.generic-extension.language.generic-extension.run stream=stdout match=exact
42
generic
```
