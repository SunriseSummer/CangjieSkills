<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.flatmap" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.flatMap

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func flatMap<R>(transform: (T) -> Iterator<R>): Iterator<R>
```

创建一个带 flatten 功能的映射。

## 契约

参数：

- transform: (T) -> Iterable\<R> - 给定的映射函数。

返回值：

- Iterator\<R> - 返回一个带 flatten 功能的映射。
