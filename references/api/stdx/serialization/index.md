<!-- cj-doc kind="api-package" level="4" id="stdx.serialization.serialization" parent="api.stdx" -->
# stdx.serialization.serialization

[← stdx 包索引](../index.md)

通过 DataModel 序列化和反序列化数据。

包路径：`stdx.serialization.serialization`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`abstract DataModel`](classes/datamodel.md) | 此类为中间数据层。 |
| [`DataModelBool <: DataModel`](classes/datamodelbool/index.md) | 此类为 DataModel 的子类，实现对 Bool 类型数据的封装。 |
| [`DataModelFloat <: DataModel`](classes/datamodelfloat/index.md) | 此类为 DataModel 的子类，实现对 Float64 类型数据的封装。 |
| [`DataModelInt <: DataModel`](classes/datamodelint/index.md) | 此类为 DataModel 的子类，实现对 Int64 类型数据的封装。 |
| [`DataModelNull <: DataModel`](classes/datamodelnull.md) | 此类为 DataModel 的子类，实现对 `Null` 类型数据的封装。 |
| [`DataModelSeq <: DataModel`](classes/datamodelseq/index.md) | 此类为 DataModel 的子类，实现对 ArrayList<DataModel> 类型数据的封装。 |
| [`DataModelString <: DataModel`](classes/datamodelstring/index.md) | 此类为 DataModel 的子类，实现对 String 类型数据的封装。 |
| [`DataModelStruct <: DataModel`](classes/datamodelstruct/index.md) | 此类为 DataModel 的子类，用来实现 `class` 对象到 DataModel 的转换。 |
| [`Field`](classes/field/index.md) | 用于存储 DataModelStruct 的元素。 |
| [`DataModelException <: Exception`](classes/datamodelexception/index.md) | DataModel 的异常类。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`Serializable<T>`](interfaces/serializable/index.md) | 用于规范序列化。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`field<T>(name: String, data: T) : Field where T <: Serializable<T>`](functions/field-t-string-t-where-t-serializable-t.md) | 此函数用于将一组数据 `name` 和 `data` 封装到 Field 对象中。 |
