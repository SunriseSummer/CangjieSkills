<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.step" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.step

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func step(count: Int64): LinkedList<T>
```

以指定的间隔从链表中提取元素，并返回一个新链表。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- count: Int64 - 选取的间隔

## 返回值

- LinkedList<T> - 一个新的 LinkedList，包含了按间隔从源 LinkedList 中提取出的所有元素。

## 异常

- IllegalArgumentException - 当 count <= 0 时，抛出异常。

