<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.inspect" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.inspect

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func inspect(action: (T) -> Unit): Iterator<T>
```

迭代器每次调用 next() 对当前元素执行额外操作（不会消耗迭代器中元素）。

## 契约

参数：

- action: (T) -> Unit - 给定的操作函数。

返回值：

- Iterator\<T> - 返回一个新迭代器。
