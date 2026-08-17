<!-- cj-doc kind="api-extension" level="6" id="std.collection.class.arraylist.extension.extend-t-arraylist-t" parent="std.collection.class.arraylist" -->
# extend<T> ArrayList<T>

[← ArrayList<T>](../index.md)

`extend<T> ArrayList<T>`

为 ArrayList<T> 类型进行拓展

用于获取带索引的 ArrayList 。

## 注意
>
不支持平台：OpenHarmony。

## 返回值

- ArrayList<(Int64, T)> - 返回一个带索引的新 ArrayList。

## 成员

| 签名 | 功能 |
|---|---|
| `func enumerate(): ArrayList<(Int64, T)>` | 用于获取带索引的 ArrayList 。 |
| `func zip<R>(other: ArrayList<R>): ArrayList<(T, R)>` | 将两个 ArrayList 合并成一个新 ArrayList（长度取决于短的那个 ArrayList）。 |

