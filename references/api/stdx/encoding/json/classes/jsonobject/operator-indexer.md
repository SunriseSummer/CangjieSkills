<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.class.jsonobject.operator-indexer" parent="stdx.encoding.json.class.jsonobject" -->
# JsonObject.[]

[← JsonObject](index.md)

## 签名

```cangjie role=signature
public operator func [](key: String): JsonValue
```

获取 JsonObject 中 key 对应的 JsonValue。

## 契约

参数：

- key: String - 指定的 key。

返回值：

- JsonValue - key 对应的 JsonValue。

异常：

- JsonException - 如果 key 不是 JsonObject 的有效键，抛出异常。
