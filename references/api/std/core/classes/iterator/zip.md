<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.zip" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.zip

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func zip<R>(it: Iterator<R>): Iterator<(T, R)>
```

将两个迭代器合并成一个（长度取决于短的那个迭代器）。

## 契约

参数：

- it: Iterator\<R> - 要合并的其中一个迭代器。

返回值：

- Iterator\<(T, R)> - 返回一个新迭代器。
