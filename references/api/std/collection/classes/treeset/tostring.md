<!-- cj-doc kind="api-member" level="7" id="std.collection.class.treeset.tostring" parent="std.collection.class.treeset.extension.extend-t-treeset-t-tostring-where-t-tostring" -->
# TreeSet<T> where T <: Comparable<T>.toString

[← extend<T> TreeSet<T> <: ToString where T <: ToString](extensions/extend-t-treeset-t-tostring-where-t-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

将当前 TreeSet<T> 实例转换为字符串。

## 契约

该字符串包含 TreeSet\<T> 内每个元素的字符串表示，形如："[elem1, elem2, elem3]"。

返回值：

- String - 转换得到的字符串。
