<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.mapvalues" parent="std.collection.class.hashmap" -->
# HashMap<K, V>.mapValues

[← HashMap<K, V>](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public func mapValues<R>(transform: (K, V) -> R): HashMap<K, R>
```

对此 HashMap 进行映射并返回一个新 HashMap。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (K, V) -> R - 给定的映射函数。

## 返回值

- HashMap<K, R> - 返回一个新的 HashMap。

## 重载 2

### 签名

```cangjie role=signature
public func mapValues<R>(transform: (V) -> R): HashMap<K, R>
```

对此 HashMap 进行映射并返回一个新 HashMap。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (V) -> R - 给定的映射函数。

## 返回值

- HashMap<K, R> - 返回一个新的 HashMap。

