<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.concat" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.concat

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func concat(other: Iterator<T>): Iterator<T>
```

串联两个迭代器，当前迭代器在先，参数表示的迭代器在后。

## 契约

参数：

- other: Iterator\<T> - 要串联在后面的迭代器。

返回值：

- Iterator\<T> - 返回串联后的新迭代器。
