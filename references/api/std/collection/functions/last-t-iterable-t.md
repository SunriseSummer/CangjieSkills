<!-- cj-doc kind="api-member" level="5" id="std.collection.func.last-t-iterable-t" parent="std.collection" -->
# last<T>(Iterable<T>)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func last<T>(it: Iterable<T>): Option<T>
```

获取尾部元素。

## 契约

参数：

- it: Iterable\<T> - 给定的迭代器。

返回值：

- Option\<T> - 返回尾部元素，若为空则返回 None。
