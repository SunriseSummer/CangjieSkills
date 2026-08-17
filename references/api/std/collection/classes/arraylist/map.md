<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.map" parent="std.collection.class.arraylist" -->
# ArrayList<T>.map

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public func map<R>(transform: (T) -> R): ArrayList<R>
```

对此 ArrayList 进行映射并返回一个新 ArrayList。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) -> R - 给定的映射函数。

## 返回值

- ArrayList<R> - 返回一个新的 ArrayList。

