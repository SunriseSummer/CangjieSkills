<!-- cj-doc kind="api-package" level="4" id="stdx.unittest.data" parent="api.stdx" -->
# stdx.unittest.data

[← stdx 包索引](../../index.md)

为参数化测试读取 JSON、CSV、TSV 等输入数据。

包路径：`stdx.unittest.data`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`CsvStrategy<T> <: DataStrategy<T> where T <: Serializable<T>`](classes/csvstrategy/index.md) | DataStrategy 对 CSV 数据格式的序列化实现。 |
| [`JsonStrategy<T> <: DataStrategy<T> where T <: Serializable<T>`](classes/jsonstrategy/index.md) | DataStrategy 对 JSON 数据格式的序列化实现。 |
| [`SerializableProvider<T> <: DataProvider<T> where T <: Serializable<T>`](classes/serializableprovider/index.md) | 获取序列化数据 DataProvider 接口的实现。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`csv<T>( fileName: String, delimiter!: Rune = ',', quoteChar!: Rune = '"', escapeChar!: Rune = '"', commentChar!: Option<Rune> = None, header!: Option<Array<String>> = None, skipRows!: Array<UInt64> = [], skipColumns!: Array<UInt64> = [], skipEmptyLines!: Bool = false ): CsvStrategy<T> where T <: Serializable<T>`](functions/csv-t-string-rune-rune-rune-option-rune-option-array-string-arr-08e5928e.md) | 该函数可从 csv 文件中读取类型 T 的数据值，其中 T 必须可被序列化。 |
| [`json<T>(fileName: String): JsonStrategy<T> where T <: Serializable<T>`](functions/json-t-string-where-t-serializable-t.md) | 该函数可从 JSON 文件中读取类型 T 的数据值，其中 T 必须可被序列化。 |
| [`tsv<T>( fileName: String, quoteChar!: Rune = '"', escapeChar!: Rune = '"', commentChar!: Option<Rune> = None, header!: Option<Array<String>> = None, skipRows!: Array<UInt64> = [], skipColumns!: Array<UInt64> = [], skipEmptyLines!: Bool = false ): CsvStrategy<T> where T <: Serializable<T>`](functions/tsv-t-string-rune-rune-option-rune-option-array-string-array-ui-34262077.md) | 该函数可从 tsv 文件中读取类型 T 的数据值，其中 T 必须可被序列化。 |
