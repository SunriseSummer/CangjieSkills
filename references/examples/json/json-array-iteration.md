<!-- cj-doc kind="example-leaf" level="4" id="examples.json.json-array-iteration" parent="examples.json" -->
# 按索引遍历 JsonArray

[← JSON 与对象序列化](index.md)

JsonArray 在 1.1.3.1 中不是 Iterable；按 0..size() 生成索引后读取元素。

## 典型示例

`JsonArray` 在 1.1.3.1 中不是 `Iterable`。需要逐项处理时，可按 `0..size()` 产生索引并通过 `operator []` 读取；若后续需要集合算法，也可先调用 `getItems()`。

```cangjie cjtest=run id=examples.json.json-array-iteration.api.stdx.json-array.indexed-iteration form=unit timeout=30s requires=stdx
package stdx_json_array_iteration

import stdx.encoding.json.*

main(): Unit {
    let values = JsonValue.fromStr("[3, 5, 8]").asArray()
    var total = 0
    for (index in 0..values.size()) {
        total += values[index].asInt().getValue()
    }
    println(total)
}
```

预期标准输出：

```text cjtest=expect for=examples.json.json-array-iteration.api.stdx.json-array.indexed-iteration stream=stdout match=exact
16
```
