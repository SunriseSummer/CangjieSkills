<!-- cj-doc kind="api-extension" level="6" id="std.core.struct.array.extension.extend-t-array-t" parent="std.core.struct.array" -->
# extend<T> Array<T>

[← Array<T>](../index.md)

`extend<T> Array<T>`

为 Array<T> 类型进行拓展

用于获取带索引的数组。

## 注意
>
不支持平台：OpenHarmony。

## 返回值

- Array<(Int64, T)> - 返回一个带索引的新数组。

## 成员

| 签名 | 功能 |
|---|---|
| `func enumerate(): Array<(Int64, T)>` | 用于获取带索引的数组。 |
| `func zip<R>(other: Array<R>): Array<(T, R)>` | 将两个数组合并成一个新数组（长度取决于短的那个数组）。 |

