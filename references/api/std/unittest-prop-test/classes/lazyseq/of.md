<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.lazyseq.of" parent="std.unittest.prop_test.class.lazyseq" -->
# LazySeq<T>.of

[← LazySeq<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func of(Iterable<T>)

### 签名

```cangjie role=signature
public static func of(iterable: Iterable<T>): LazySeq<T>
```

从迭代器构造一个序列。

### 契约

参数：

- iterable: Iterable\<T> - 待处理的迭代器。

返回值：

- LazySeq\<T> - 处理后的序列。

## static func of(Array<T>)

### 签名

```cangjie role=signature
public static func of(array: Array<T>): LazySeq<T>
```

从数组构造一个序列。

### 契约

参数：

- array: Array\<T> - 待处理的数组。

返回值：

- LazySeq\<T> - 处理后的序列。
