<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.lazyseq.concat" parent="std.unittest.prop_test.class.lazyseq" -->
# LazySeq<T>.concat

[← LazySeq<T>](index.md)

## 签名

```cangjie role=signature
public func concat(other: LazySeq<T>): LazySeq<T>
```

增加一个序列到此序列中。

## 契约

功能：增加一个序列到此序列中。复杂度为 O(1) 。

参数：

- other: LazySeq\<T> - 被增加的序列。

返回值：

- LazySeq\<T> - 增加元素后的序列。
