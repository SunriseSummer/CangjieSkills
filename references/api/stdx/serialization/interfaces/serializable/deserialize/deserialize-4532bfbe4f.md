<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-4532bfbe4f" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): Array<T>
```

将 DataModel 反序列化为 Array<T>。

适用扩展：[extend<T> Array<T> <: Serializable<Array<T>> where T <: Serializable<T>](../extensions/extend-t-array-t-serializable-array-t-where-t-serializable-t.md)。

## 契约

参数：

- dm: DataModel - 通常应为包含元素中间表示的 DataModelSeq。

返回值：

- Array<T> - 逐项反序列化后的数组。

前置条件：

- `dm` 应由元素类型相同的 `Array<T>.serialize()` 产生，或是元素均可反序列化为 `T` 的 `DataModelSeq`；中间表示类型不匹配时抛出 `DataModelException`。

## 数组往返

仓颉 1.1.3 配合 stdx 1.1.3.1 可直接序列化并反序列化 `Array<T>`；下面的 Windows x86_64 cjnative 示例也已实际执行验证。

```cangjie cjtest=run id=api.stdx.array-serialization-workaround.run form=unit requires=stdx timeout=60s
package stdx_array_serialization

import stdx.serialization.serialization.*

main(): Unit {
    let model = ["north", "east"].serialize()
    let restored = Array<String>.deserialize(model)
    println("${restored.size}|${restored[0]}|${restored[1]}")
}
```

```text cjtest=expect for=api.stdx.array-serialization-workaround.run stream=stdout match=exact
2|north|east
```
