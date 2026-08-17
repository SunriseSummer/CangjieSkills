<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.flatmap" parent="std.collection.class.arraylist" -->
# ArrayList<T>.flatMap

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public func flatMap<R>(transform: (T) -> ArrayList<R>): ArrayList<R>
```

对 ArrayList 中的每个元素应用一个转换闭包（transform），该闭包返回一个新的 ArrayList，然后将所有返回的 ArrayList“压平”（flatten）并连接成一个单一的结果 ArrayList。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) -> ArrayList<R> - 给定的映射函数。

## 返回值

- ArrayList<R> -  被“映射（map）”和“压平（flatten）”后的新 ArrayList。

