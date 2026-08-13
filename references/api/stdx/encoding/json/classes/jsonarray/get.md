<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.class.jsonarray.get" parent="stdx.encoding.json.class.jsonarray" -->
# JsonArray.get

[← JsonArray](index.md)

## 签名

```cangjie role=signature
public func get(index: Int64): Option<JsonValue>
```

获取 JsonArray 中指定索引的 JsonValue，并用 Option<JsonValue> 封装。

## 契约

参数：

- index: Int64 - 指定的索引。

返回值：

- Option\<JsonValue> - 对应索引的 JsonValue 数据的封装形式。
