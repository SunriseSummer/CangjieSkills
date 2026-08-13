<!-- cj-doc kind="api-type" level="5" id="stdx.serialization.serialization.class.datamodelstruct" parent="stdx.serialization.serialization" -->
# DataModelStruct

[← stdx.serialization.serialization](../../index.md)

`DataModelStruct <: DataModel`

此类为 DataModel 的子类，用来实现 `class` 对象到 DataModel 的转换。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空参的 `DataModelStructfields` 默认为空的 ArrayList<Field>。 |
| [`init(list: ArrayList<Field>)`](init.md) | 构造一个具有初始数据的 DataModelStruct。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(fie: Field): DataModelStruct`](add.md) | 添加数据 `fie` 到 DataModelStruct 中。 |
| [`get(key: String): DataModel`](get.md) | 获取 `key` 对应的数据。 |
| [`getFields(): ArrayList<Field>`](getfields.md) | 获取 DataModelStruct 的数据集合。 |
