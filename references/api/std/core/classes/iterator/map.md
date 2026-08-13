<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.map" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.map

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func map<R>(transform: (T)-> R): Iterator<R>
```

创建一个映射。

## 契约

参数：

- transform: (T) ->R - 给定的映射函数。

返回值：

- Iterator\<R> - 返回一个映射。
