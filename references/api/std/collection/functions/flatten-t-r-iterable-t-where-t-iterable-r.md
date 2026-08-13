<!-- cj-doc kind="api-member" level="5" id="std.collection.func.flatten-t-r-iterable-t-where-t-iterable-r" parent="std.collection" -->
# flatten<T, R>(Iterable<T>) where T <: Iterable<R>

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func flatten<T, R>(it: Iterable<T>): Iterator<R> where T <: Iterable<R>
```

将嵌套的迭代器展开一层。

## 契约

参数：

- it: Iterable\<T> - 给定的迭代器。

返回值：

- Iterator\<R> - 返回展开一层后的迭代器。
