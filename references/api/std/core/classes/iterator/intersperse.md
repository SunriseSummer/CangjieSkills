<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.intersperse" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.intersperse

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func intersperse(separator: T): Iterator<T>
```

迭代器每两个元素之间插入一个给定的新元素。

## 契约

参数：

- separator: T - 给定的元素。

返回值：

- Iterator\<T> - 返回一个新迭代器。
