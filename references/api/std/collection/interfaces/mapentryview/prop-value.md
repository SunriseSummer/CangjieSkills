<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.mapentryview.prop-value" parent="std.collection.interface.mapentryview" -->
# MapEntryView<K, V>.value

[← MapEntryView<K, V>](index.md)

## 签名

```cangjie role=signature
mut prop value: ?V
```

读取或修改视图对应原始映射的 value。

## 契约

功能：读取或修改视图对应原始映射的 value。
设置非空的 value 时，如果该视图的 value 不存在，则在该视图对应的原始映射中新增元素。
设置为 `None` 时，则会删除当前 Entry，删除完之后仍然能继续使用该视图。

类型：Option(V)
