<!-- cj-doc kind="api-member" level="7" id="std.collection.class.hashset.tostring" parent="std.collection.class.hashset.extension.extend-t-hashset-t-tostring-where-t-tostring" -->
# HashSet<T> where T <: Hashable & Equatable<T>.toString

[← extend<T> HashSet<T> <: ToString where T <: ToString](extensions/extend-t-hashset-t-tostring-where-t-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

将当前 HashSet<T> 实例转换为字符串。

## 契约

该字符串包含 HashSet\<T> 内每个元素的字符串表示，形如："[elem1, elem2, elem3]"。

返回值：

- String - 转换得到的字符串。
