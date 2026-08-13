<!-- cj-doc kind="api-member" level="7" id="std.collection.class.arraylist.tostring" parent="std.collection.class.arraylist.extension.extend-t-arraylist-t-tostring-where-t-tostring" -->
# ArrayList<T>.toString

[← extend<T> ArrayList<T> <: ToString where T <: ToString](extensions/extend-t-arraylist-t-tostring-where-t-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

将当前数组转换为字符串。

## 契约

该字符串包含数组内每个元素的字符串表示，形如："[elem1, elem2, elem3]"。

返回值：

- String - 转换得到的字符串。
