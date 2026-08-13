<!-- cj-doc kind="api-type" level="5" id="std.unittest.common.interface.prettyprintable" parent="std.unittest.common" -->
# PrettyPrintable

[← std.unittest.common](../../index.md)

`PrettyPrintable`

类型实现该接口表示可以较好地进行颜色及缩进格式的打印。

## 方法

| 签名 | 功能 |
|---|---|
| [`pprint(to: PrettyPrinter): PrettyPrinter`](pprint.md) | 将类型值打印到指定的打印器中。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> Array<T> <: PrettyPrintable where T <: PrettyPrintable`](extensions/extend-t-array-t-prettyprintable-where-t-prettyprintable.md) | 对 Array<T> 扩展实现 PrettyPrintable。 |
| [`extend<T> ArrayList<T> <: PrettyPrintable where T <: PrettyPrintable`](extensions/extend-t-arraylist-t-prettyprintable-where-t-prettyprintable.md) | 对 ArrayList<T> 扩展实现 PrettyPrintable。 |
