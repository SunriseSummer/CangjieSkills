<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.class.jsonobject.get" parent="stdx.encoding.json.class.jsonobject" -->
# JsonObject.get

[← JsonObject](index.md)

## 签名

```cangjie role=signature
public func get(key: String): Option<JsonValue>
```

获取 JsonObject 中 key 对应的 JsonValue，并用 Option<JsonValue> 封装。

## 契约

参数：

- key: String - 指定的 key。

返回值：

- Option\<JsonValue> - key 对应的 JsonValue 的封装形式。
