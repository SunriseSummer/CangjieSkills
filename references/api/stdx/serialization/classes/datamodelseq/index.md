<!-- cj-doc kind="api-type" level="5" id="stdx.serialization.serialization.class.datamodelseq" parent="stdx.serialization.serialization" -->
# DataModelSeq

[← stdx.serialization.serialization](../../index.md)

`DataModelSeq <: DataModel`

此类为 DataModel 的子类，实现对 ArrayList<DataModel> 类型数据的封装。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个参数为空的 DataModelSeq 实例。 |
| [`init(list: ArrayList<DataModel>)`](init.md) | 构造一个具有初始数据的 DataModelSeq 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(dm: DataModel): Unit`](add.md) | 在 DataModelSeq 末尾增加一个 DataModel 数据。 |
| [`getItems(): ArrayList<DataModel>`](getitems.md) | 获取 DataModelSeq 中的数据。 |
