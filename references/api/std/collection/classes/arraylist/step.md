<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.step" parent="std.collection.class.arraylist" -->
# ArrayList<T>.step

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public func step(count: Int64): ArrayList<T>
```

以指定的间隔从 ArrayList 中提取元素，并返回一个新 ArrayList。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- count: Int64 - 选取的间隔

## 返回值

- ArrayList<T> - 一个新的 ArrayList，包含了按间隔从源 ArrayList 中提取出的所有元素。

## 异常

- IllegalArgumentException - 当 count <= 0 时，抛出异常。

