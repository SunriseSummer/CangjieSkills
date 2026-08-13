<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.map.entryview" parent="std.collection.interface.map" -->
# Map<K, V>.entryView

[← Map<K, V>](index.md)

## 签名

```cangjie role=signature
func entryView(k: K): MapEntryView<K, V>
```

获取键 k 对应的视图。

## 契约

参数：

- k: K - 待获取其视图的键。

返回值：

- MapEntryView\<K, V> - 键 k 对应的视图。
