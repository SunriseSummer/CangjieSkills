<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.class.jsonarray.operator-indexer" parent="stdx.encoding.json.class.jsonarray" -->
# JsonArray.[]

[← JsonArray](index.md)

## 签名

```cangjie role=signature
public operator func [](index: Int64): JsonValue
```

获取 JsonArray 中指定索引的 JsonValue。

## 契约

参数：

- index: Int64 - 指定的索引。

返回值：

- JsonValue - 对应索引的 JsonValue。

异常：

- JsonException - 如果 index 不是 JsonArray 的有效索引，抛出异常。

## 典型示例

`JsonArray` 在 1.0.5.1 中不是 `Iterable`。需要逐项处理时，可按 `0..size()` 产生索引并通过 `operator []` 读取；若后续需要集合算法，也可先调用 `getItems()`。

```cangjie cjtest=run id=api.stdx.json-array.indexed-iteration form=unit timeout=30s requires=stdx
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

```text cjtest=expect for=api.stdx.json-array.indexed-iteration stream=stdout match=exact
16
```
