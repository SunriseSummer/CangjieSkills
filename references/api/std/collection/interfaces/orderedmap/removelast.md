<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.orderedmap.removelast" parent="std.collection.interface.orderedmap" -->
# OrderedMap<K, V>.removeLast

[← OrderedMap<K, V>](index.md)

## 签名

```cangjie role=signature
func removeLast(): ?(K, V)
```

删除 OrderedMap 的最后一个元素。

## 契约

返回值：

- ?(K, V) - 如果当前 OrderedMap 不为空，返回 Option 封装的被删除的键值对，否则返回 `None`。
