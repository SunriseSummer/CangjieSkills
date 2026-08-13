<!-- cj-doc kind="api-member" level="5" id="std.collection.func.first-t-iterable-t" parent="std.collection" -->
# first<T>(Iterable<T>)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func first<T>(it: Iterable<T>): Option<T>
```

获取头部元素。

## 契约

参数：

- it: Iterable\<T> - 给定的迭代器。

返回值：

- Option\<T> - 返回头部元素，若为空则返回 None。
