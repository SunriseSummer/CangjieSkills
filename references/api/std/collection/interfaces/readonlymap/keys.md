<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.readonlymap.keys" parent="std.collection.interface.readonlymap" -->
# ReadOnlyMap<K, V>.keys

[← ReadOnlyMap<K, V>](index.md)

## 签名

```cangjie role=signature
func keys(): EquatableCollection<K>
```

返回 ReadOnlyMap 中所有的 key，并将所有 key 存储在一个 EquatableCollection<K> 容器中。

## 契约

返回值：

- EquatableCollection\<K> - 保存所有返回的 key。
