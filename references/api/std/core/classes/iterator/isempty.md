<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.isempty" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.isEmpty

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func isEmpty(): Bool
```

判断当前迭代器是否为空。

## 契约

功能：判断当前迭代器是否为空。此方法会调用 next() ，根据其返回值判断当前迭代器是否为空。因此如果当前迭代器不为空，则会消耗一个元素。

返回值：

- Bool - 返回当前迭代器是否为空。
