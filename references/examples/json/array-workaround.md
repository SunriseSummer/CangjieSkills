<!-- cj-doc kind="example-leaf" level="4" id="examples.json.array-workaround" parent="examples.json" -->
# 安全反序列化对象数组

[← JSON 与对象序列化](index.md)

序列化需匹配 stdx 版本并检查 `DataModel` 实际类型；Windows cjnative 1.0.5 中避免直接走 `Array<T>` Serializable 运行时路径。

## 1.0.5 Windows cjnative 兼容写法

发布件声明了 `Array<T>` 的 `Serializable` 扩展，但 Windows x86_64 cjnative 1.0.5 配合 stdx 1.0.5.1 时，直接调用 `field<Array<T>>` 或 `Array<T>.deserialize` 可能在运行期（runtime）因接口函数表缺失而崩溃。显式使用 `DataModelSeq`，逐项调用元素类型的 `deserialize`，最后由 `ArrayList<T>.toArray()` 转回数组。

```cangjie cjtest=run id=examples.json.array-workaround.api.stdx.array-serialization-workaround.run form=unit requires=stdx timeout=60s
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

预期标准输出：

```text cjtest=expect for=examples.json.array-workaround.api.stdx.array-serialization-workaround.run stream=stdout match=exact
2|north|east
```
