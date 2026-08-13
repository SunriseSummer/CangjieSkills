<!-- cj-doc kind="api-member" level="5" id="stdx.unittest.data.func.csv-t-string-rune-rune-rune-option-rune-option-array-string-arr-08e5928e" parent="stdx.unittest.data" -->
# csv<T>(String, Rune, Rune, Rune, Option<Rune>, Option<Array<String>>, Array<UInt64>, Array<UInt64>, Bool) where T <: Serializable<T>

[← stdx.unittest.data](../index.md)

## 签名

```cangjie role=signature
public func csv<T>(
    fileName: String,
    delimiter!: Rune = ',',
    quoteChar!: Rune = '"',
    escapeChar!: Rune = '"',
    commentChar!: Option<Rune> = None,
    header!: Option<Array<String>> = None,
    skipRows!: Array<UInt64> = [],
    skipColumns!: Array<UInt64> = [],
    skipEmptyLines!: Bool = false
): CsvStrategy<T> where T <: Serializable<T>
```

该函数可从 csv 文件中读取类型 T 的数据值，其中 T 必须可被序列化。

## 契约

功能：该函数可从 csv 文件中读取类型 T 的数据值，其中 T 必须可被序列化。该函数的返回值是参数化测试的一种参数源。

参数：

- fileName: String - CSV 格式的文件地址，可为相对地址，不限制后缀名。
- delimiter!: Rune - 一行中作为元素分隔符的符号。默认值为 `,` （逗号）。
- quoteChar!: Rune - 括住元素的符号。默认值为 `"` （双引号）。
- escapeChar!: Rune ：转义括住元素的符号。默认值为 `"` （双引号）。
- commentChar!: Option\<Rune> - 注释符号，跳过一行。必须在一行的最左侧。默认值是 `None`（不存在注释符号）。
- header!: Option\<Array\<String>> - 提供一种方式覆盖第一行。
    - 当 header 被指定时，文件的第一行将被作为数据行，指定的 header 将被使用。
    - 当 header 被指定，同时第一行通过指定 `skipRows` 被跳过时，第一行将被忽略，指定的 header 将被使用。
    - 当 header 未被指定时，即值为 `None` 时，文件的第一行将被作为表头。此为默认值。
- skipRows!: Array\<UInt64> - 指定需被跳过的数据行号，行号从 0 开始。默认值为空数组 `[]` 。
- skipColumns!: Array\<UInt64> - 指定需被跳过的数据列号，列号从 0 开始。当有数据列被跳过，并且用户指定了自定义的 header 时，该 header 将按照跳过后的实际数据列对应。默认值为空数据 `[]` 。
- skipEmptyLines!: Bool - 指定是否需要跳过空行。默认值为 `false` 。

返回值：

- CsvStrategy\<T> 对象，T 可被序列化，数据值从 CSV 文件中读取。

异常：

- IllegalStateException - 如果 CSV 数据的结构不正确，则抛出该异常。
