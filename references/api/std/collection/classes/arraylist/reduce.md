<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.reduce" parent="std.collection.class.arraylist" -->
# ArrayList<T>.reduce

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public func reduce(operation: (T, T) -> T): Option<T>
```

使用第一个元素作为初始值，从左向右计算。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- operation: (T, T) -> T - 给定的计算函数。

## 返回值

- Option<T> - 返回计算结果。

