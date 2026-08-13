<!-- cj-doc kind="api-member" level="7" id="std.collection.class.linkedlist.tostring" parent="std.collection.class.linkedlist.extension.extend-t-linkedlist-t-tostring-where-t-tostring" -->
# LinkedList<T>.toString

[← extend<T> LinkedList<T> <: ToString where T <: ToString](extensions/extend-t-linkedlist-t-tostring-where-t-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

将当前 LinkedList<T> 实例转换为字符串。

## 契约

该字符串包含 LinkedList\<T> 内每个元素的字符串表示，形如："[elem1, elem2, elem3]"。

返回值：

- String - 转换得到的字符串。
