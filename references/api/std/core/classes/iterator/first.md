<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.first" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.first

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func first(): Option<T>
```

获取当前迭代器的头部元素。

## 契约

功能：获取当前迭代器的头部元素。此方法会获取并消耗第一个元素。

返回值：

- Option\<T> - 返回头部元素，若为空则返回 None。
