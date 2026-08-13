<!-- cj-doc kind="example-leaf" level="4" id="examples.abstractions.direct-extension" parent="examples.abstractions" -->
# 为既有类型增加直接扩展

[← 接口、泛型与扩展](index.md)

通过 extend Type 添加不含存储状态的实例成员，并以普通点调用使用。

## 已验证示例

扩展成员像普通实例函数一样调用；它只复用 `String` 已有状态，不向类型增加字段。

```cangjie cjtest=run id=examples.abstractions.direct-extension.language.direct-extension.run form=unit timeout=20s
package direct_extension_example

extend String {
    public func wrapped(): String {
        return "[${this}]"
    }
}

main(): Unit {
    println("Cangjie".wrapped())
}
```

预期标准输出：

```text cjtest=expect for=examples.abstractions.direct-extension.language.direct-extension.run stream=stdout match=exact
[Cangjie]
```
