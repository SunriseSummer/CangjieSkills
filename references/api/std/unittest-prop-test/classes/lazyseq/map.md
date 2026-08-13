<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.lazyseq.map" parent="std.unittest.prop_test.class.lazyseq" -->
# LazySeq<T>.map

[← LazySeq<T>](index.md)

## 签名

```cangjie role=signature
public func map<U>(body: (T) -> U): LazySeq<U>
```

对序列中的每个元素执行闭包处理。

## 契约

参数：

- body: (T) -> U - 对每个元素执行的闭包。

返回值：

- LazySeq\<U> - 处理后的序列。
