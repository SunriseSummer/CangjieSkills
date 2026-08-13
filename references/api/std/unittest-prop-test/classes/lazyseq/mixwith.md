<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.lazyseq.mixwith" parent="std.unittest.prop_test.class.lazyseq" -->
# LazySeq<T>.mixWith

[← LazySeq<T>](index.md)

## 签名

```cangjie role=signature
public func mixWith(other: LazySeq<T>): LazySeq<T>
```

将新序列穿插进原序列中。

## 契约

例如：{1,2,3,4}.mixWith({5,6,7}) -> {1,5,2,6,3,7,4}

参数：

- other: LazySeq\<T> - 待插入的序列。

返回值：

- LazySeq\<T> - 处理后的序列。
