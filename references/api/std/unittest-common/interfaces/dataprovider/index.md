<!-- cj-doc kind="api-type" level="5" id="std.unittest.common.interface.dataprovider" parent="std.unittest.common" -->
# DataProvider

[← std.unittest.common](../../index.md)

`DataProvider<T>`

DataStrategy 的组件，用于提供测试数据，T 指定提供者提供的数据类型。

## 方法

| 签名 | 功能 |
|---|---|
| [`provide(): Iterable<T>`](provide.md) | 获取数据迭代器。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> Array<T> <: DataProvider<T>`](extensions/extend-t-array-t-dataprovider-t.md) | 对 Array<T> 进行扩展。 |
| [`extend<T> Range<T> <: DataProvider<T>`](extensions/extend-t-range-t-dataprovider-t.md) | 对 Range<T> 进行扩展。 |
