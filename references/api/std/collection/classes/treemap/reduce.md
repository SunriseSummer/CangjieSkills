<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.reduce" parent="std.collection.class.treemap" -->
# TreeMap<K, V>.reduce

[← TreeMap<K, V>](index.md)

## 签名

```cangjie role=signature
public func reduce(operation: (V, V) -> V): Option<V>
```

使用第一个值作为初始值，从左向右计算。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- operation: (V, V) -> V - 给定的计算函数。

## 返回值

- Option<V> - 返回计算结果。

