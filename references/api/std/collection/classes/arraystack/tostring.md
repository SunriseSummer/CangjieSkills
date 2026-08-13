<!-- cj-doc kind="api-member" level="7" id="std.collection.class.arraystack.tostring" parent="std.collection.class.arraystack.extension.extend-t-arraystack-t-tostring-where-t-tostring" -->
# ArrayStack<T>.toString

[← extend<T> ArrayStack<T> <: ToString where T <: ToString](extensions/extend-t-arraystack-t-tostring-where-t-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

获取当前 ArrayStack<T> 实例的字符串表示。

## 契约

该字符串包含栈内每个元素的字符串表示，其顺序为从后到前的顺序。形如："[elem1, elem2, elem3]"。

返回值：

- String - 当前栈的字符串表示。
