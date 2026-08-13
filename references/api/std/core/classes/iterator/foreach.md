<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.foreach" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.forEach

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func forEach(action: (T)-> Unit): Unit
```

遍历当前迭代器所有元素，对每个元素执行给定的操作。

## 契约

功能：遍历当前迭代器所有元素，对每个元素执行给定的操作。此方法会消耗迭代器中的所有元素。

参数：

- action: (T) -> Unit - 给定的操作函数。
