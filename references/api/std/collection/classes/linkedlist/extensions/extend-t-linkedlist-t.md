<!-- cj-doc kind="api-extension" level="6" id="std.collection.class.linkedlist.extension.extend-t-linkedlist-t" parent="std.collection.class.linkedlist" -->
# extend<T> LinkedList<T>

[← LinkedList<T>](../index.md)

`extend<T> LinkedList<T>`

为 LinkedList<T> 类型进行拓展

用于获取带索引的链表。

## 注意
>
不支持平台：OpenHarmony。

## 返回值

- LinkedList<(Int64, T)> - 返回一个带索引的新 LinkedList。

## 成员

| 签名 | 功能 |
|---|---|
| `func enumerate(): LinkedList<(Int64, T)>` | 用于获取带索引的链表。 |
| `func zip<R>(other: LinkedList<R>): LinkedList<(T, R)>` | 将两个 LinkedList 合并成一个新 LinkedList（长度取决于短的那个链表）。 |

