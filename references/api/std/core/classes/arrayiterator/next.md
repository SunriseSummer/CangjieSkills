<!-- cj-doc kind="api-member" level="6" id="std.core.class.arrayiterator.next" parent="std.core.class.arrayiterator" -->
# ArrayIterator<T>.next

[← ArrayIterator<T>](index.md)

## 签名

```cangjie role=signature
public func next(): Option<T>
```

返回数组迭代器中的下一个值。

## 契约

返回值：

- Option\<T> - 数组迭代器中的下一个成员，用 Option 封装，迭代到末尾时返回 `None`。
