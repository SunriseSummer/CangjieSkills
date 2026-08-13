<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.getrawarray" parent="std.collection.class.arraylist" -->
# ArrayList<T>.getRawArray

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public unsafe func getRawArray(): Array<T>
```

返回 ArrayList 的原始数据。

## 契约

> **注意：**
>
> 这是一个 unsafe 的接口，使用处需要在 unsafe 上下文中。
>
> 原始数据是指 ArrayList 底层实现的数组，其大小大于等于 ArrayList 中的元素数量，且索引大于等于 ArrayList 大小的位置中可能包含有未初始化的元素，对其进行访问可能会产生未定义的行为。

返回值：

- Array\<T> - ArrayList 的底层原始数据。
