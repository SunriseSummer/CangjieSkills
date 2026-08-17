<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.fold" parent="std.collection.class.treemap" -->
# TreeMap<K, V>.fold

[← TreeMap<K, V>](index.md)

## 签名

```cangjie role=signature
public func fold<R>(initial: R, operation: (R, K, V) -> R): R
```

使用指定初始值，从左向右计算。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- initial: R - 给定的 R 类型的初始值。
- operation: (R, K, V) -> R - 给定的计算函数。

## 返回值

- R - 返回最终计算得到的值。

