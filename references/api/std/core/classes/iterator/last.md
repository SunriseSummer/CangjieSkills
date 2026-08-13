<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.last" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.last

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func last(): Option<T>
```

获取当前迭代器尾部元素。

## 契约

功能：获取当前迭代器尾部元素。此方法会获取并消耗迭代器中的所有元素，并返回最后一个元素。

返回值：

- Option\<T> - 返回尾部元素，若为空则返回 None。
