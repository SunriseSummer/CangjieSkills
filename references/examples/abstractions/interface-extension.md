<!-- cj-doc kind="example-leaf" level="4" id="examples.abstractions.interface-extension" parent="examples.abstractions" -->
# 用接口扩展声明既有能力

[← 接口、泛型与扩展](index.md)

类型已有所需成员时，以空接口扩展建立能力关系而不重复实现。

## 已验证示例

若既有类型已经具备接口要求的公开成员，接口扩展体可以为空；扩展后该类型可按接口统一使用。

```cangjie cjtest=run id=examples.abstractions.interface-extension.language.interface-extension.run form=unit timeout=20s
package interface_extension_example

interface Sizeable {
    prop size: Int64
}

extend<T> Array<T> <: Sizeable {}

func printSize(value: Sizeable): Unit {
    println(value.size)
}

main(): Unit {
    printSize([10, 20, 30])
}
```

预期标准输出：

```text cjtest=expect for=examples.abstractions.interface-extension.language.interface-extension.run stream=stdout match=exact
3
```
