<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.map" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.map

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func map<R>(transform: (T) -> R): LinkedList<R>
```

对此 LinkedList 进行映射并返回一个新 LinkedList。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) ->R - 给定的映射函数。

## 返回值

- LinkedList<R> - 返回一个新的 LinkedList。

