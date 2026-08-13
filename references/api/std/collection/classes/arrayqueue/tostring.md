<!-- cj-doc kind="api-member" level="7" id="std.collection.class.arrayqueue.tostring" parent="std.collection.class.arrayqueue.extension.extend-t-arrayqueue-t-tostring-where-t-tostring" -->
# ArrayQueue<T>.toString

[← extend<T> ArrayQueue<T> <: ToString where T <: ToString](extensions/extend-t-arrayqueue-t-tostring-where-t-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

获取当前 ArrayQueue<T> 实例的字符串表示。

## 契约

该字符串包含双端队列内每个元素的字符串表示，其顺序为从前到后的顺序，形如："[elem1, elem2, elem3]"。

返回值：

- String - 转换得到的字符串。
