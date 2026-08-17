<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.take" parent="std.collection.class.arraylist" -->
# ArrayList<T>.take

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public func take(count: Int64): ArrayList<T>
```

从数组取出特定个数元素并返回一个新数组。

当 count 小于等于 0 时，抛出异常。当 count 等于 0 时，不取元素，返回空数组。当 count 大于 0 小于源数组的大小时，取前 count 个元素，返回新数组。当 count 大于等于数组的大小时，取所有元素，返回新数组。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- count: Int64 - 要取出的个数。

## 返回值

- ArrayList<T> - 返回一个取出指定数量元素的新 ArrayList。

## 异常

- IllegalArgumentException - 当 count < 0 时，抛出异常。

