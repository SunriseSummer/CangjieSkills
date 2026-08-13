<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.lazyseq.mix" parent="std.unittest.prop_test.class.lazyseq" -->
# LazySeq<T>.mix

[← LazySeq<T>](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## static func mix(LazySeq<T>,LazySeq<T>)

### 签名

```cangjie role=signature
public static func mix(l1: LazySeq<T>, l2: LazySeq<T>): LazySeq<T>
```

两个序列穿插混合成一个。

### 契约

例如：mix({1,2,3,4}, {5,6,7}) -> {1,5,2,6,3,7,4}

参数：

- l1: LazySeq\<T> - 待穿插的序列。
- l2: LazySeq\<T> - 待穿插的序列。

返回值：

- LazySeq\<T> - 处理后的序列。

## static func mix(LazySeq<T>,LazySeq<T>,LazySeq<T>)

### 签名

```cangjie role=signature
public static func mix(l1: LazySeq<T>, l2: LazySeq<T>, l3: LazySeq<T>): LazySeq<T>
```

三个序列穿插混合成一个。

### 契约

参数：

- l1: LazySeq\<T> - 待穿插的序列。
- l2: LazySeq\<T> - 待穿插的序列。
- l3: LazySeq\<T> - 待穿插的序列。

返回值：

- LazySeq\<T> - 处理后的序列。

## static func mix(LazySeq<T>,LazySeq<T>,LazySeq<T>,LazySeq<T>)

### 签名

```cangjie role=signature
public static func mix(l1: LazySeq<T>, l2: LazySeq<T>, l3: LazySeq<T>, l4: LazySeq<T>): LazySeq<T>
```

四个序列穿插混合成一个。

### 契约

参数：

- l1: LazySeq\<T> - 待穿插的序列。
- l2: LazySeq\<T> - 待穿插的序列。
- l3: LazySeq\<T> - 待穿插的序列。
- l4: LazySeq\<T> - 待穿插的序列。

返回值：

- LazySeq\<T> - 处理后的序列。

## static func mix(LazySeq<T>,LazySeq<T>,LazySeq<T>,LazySeq<T>,LazySeq<T>)

### 签名

```cangjie role=signature
public static func mix(l1: LazySeq<T>, l2: LazySeq<T>, l3: LazySeq<T>, l4: LazySeq<T>, l5: LazySeq<T>): LazySeq<T>
```

五个序列穿插混合成一个。

### 契约

参数：

- l1: LazySeq\<T> - 待穿插的序列。
- l2: LazySeq\<T> - 待穿插的序列。
- l3: LazySeq\<T> - 待穿插的序列。
- l4: LazySeq\<T> - 待穿插的序列。
- l5: LazySeq\<T> - 待穿插的序列。

返回值：

- LazySeq\<T> - 处理后的序列。
