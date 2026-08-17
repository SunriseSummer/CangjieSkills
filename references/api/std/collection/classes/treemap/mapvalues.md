<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.mapvalues" parent="std.collection.class.treemap" -->
# TreeMap<K, V>.mapValues

[← TreeMap<K, V>](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public func mapValues<R>(transform: (K, V) -> R): TreeMap<K, R>
```

对此 TreeMap 进行映射并返回一个新 TreeMap。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (K, V) -> R - 给定的映射函数。

## 返回值

- TreeMap<K, R> - 返回一个新的 TreeMap。

## 重载 2

### 签名

```cangjie role=signature
public func mapValues<R>(transform: (V) -> R): TreeMap<K, R>
```

对此 TreeMap<K, R> 进行映射并返回一个新 TreeMap<K, R>。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (V) -> R - 给定的映射函数。

## 返回值

- TreeMap<K, R> - 返回一个新的 TreeMap<K, R>。

