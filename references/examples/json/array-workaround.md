<!-- cj-doc kind="example-leaf" level="4" id="examples.json.array-workaround" parent="examples.json" -->
# 直接序列化并反序列化数组

[← JSON 与对象序列化](index.md)

仓颉 1.1.3 配合 stdx 1.1.3.1 可直接使用 `Array<T>` 的 `Serializable` 扩展；序列化与反序列化元素类型必须一致。

## 1.1.3 直接写法

调用数组的 `serialize()` 得到 `DataModelSeq`，再以相同元素类型调用 `Array<T>.deserialize`。Windows x86_64 cjnative 1.1.3 与 stdx 1.1.3.1 已实测可直接往返，无需手工遍历中间表示。

```cangjie cjtest=run id=examples.json.array-workaround.api.stdx.array-serialization-workaround.run form=unit requires=stdx timeout=60s
package stdx_array_serialization

import stdx.serialization.serialization.*

main(): Unit {
    let model = ["north", "east"].serialize()
    let restored = Array<String>.deserialize(model)
    println("${restored.size}|${restored[0]}|${restored[1]}")
}
```

预期标准输出：

```text cjtest=expect for=examples.json.array-workaround.api.stdx.array-serialization-workaround.run stream=stdout match=exact
2|north|east
```
