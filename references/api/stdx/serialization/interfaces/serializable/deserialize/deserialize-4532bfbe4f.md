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

版本限制：

- Windows x86_64 cjnative 1.0.5 + stdx 1.0.5.1 实测中，该扩展会通过编译，但直接运行可在 runtime 因 Serializable<Array<T>> 接口函数表缺失而崩溃。在该组合下不要直接调用；应显式遍历 DataModelSeq，逐项反序列化到 ArrayList<T>，再调用 toArray()。

## 1.0.5 Windows cjnative 兼容写法

发布件声明了 `Array<T>` 的 `Serializable` 扩展，但 Windows x86_64 cjnative 1.0.5 配合 stdx 1.0.5.1 时，直接调用 `field<Array<T>>` 或 `Array<T>.deserialize` 可能在运行期（runtime）因接口函数表缺失而崩溃。显式使用 `DataModelSeq`，逐项调用元素类型的 `deserialize`，最后由 `ArrayList<T>.toArray()` 转回数组。

```cangjie cjtest=run id=api.stdx.array-serialization-workaround.run form=unit requires=stdx timeout=60s
package stdx_array_serialization_workaround

import std.collection.ArrayList
import stdx.serialization.serialization.*

func serializeStrings(values: Array<String>): DataModelSeq {
    let result = DataModelSeq()
    for (value in values) {
        result.add(DataModelString(value))
    }
    return result
}

func deserializeStrings(model: DataModel): Array<String> {
    let sequence = match (model) {
        case value: DataModelSeq => value
        case _ => throw DataModelException("expected string array")
    }
    let result = ArrayList<String>()
    for (item in sequence.getItems()) {
        result.add(String.deserialize(item))
    }
    return result.toArray()
}

main(): Unit {
    let restored = deserializeStrings(serializeStrings(["north", "east"]))
    println("${restored.size}|${restored[0]}|${restored[1]}")
}
```

```text cjtest=expect for=api.stdx.array-serialization-workaround.run stream=stdout match=exact
2|north|east
```
