<!-- cj-doc kind="example-leaf" level="4" id="examples.abstractions.interface-polymorphism" parent="examples.abstractions" -->
# 依赖接口实现多态调用

[← 接口、泛型与扩展](index.md)

调用方只依赖接口类型；新增实现无需修改消费函数即可复用同一路径。

## 已验证示例

调用方只依赖接口类型；新增实现不需要修改 `describe`，即可复用同一调用路径。

```cangjie cjtest=run id=examples.abstractions.interface-polymorphism.language.interface-polymorphism.run form=unit timeout=20s
package interface_polymorphism_example

interface Named {
    func name(): String
}

class User <: Named {
    let value: String

    public init(value: String) {
        this.value = value
    }

    public func name(): String {
        return value
    }
}

func describe(item: Named): Unit {
    println("user=${item.name()}")
}

main(): Unit {
    describe(User("Ada"))
}
```

预期标准输出：

```text cjtest=expect for=examples.abstractions.interface-polymorphism.language.interface-polymorphism.run stream=stdout match=exact
user=Ada
```
