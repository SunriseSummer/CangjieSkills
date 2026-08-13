<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.url.class.form" parent="stdx.encoding.url" -->
# Form

[← stdx.encoding.url](../../index.md)

`Form`

Form 以 key-value 键值对形式存储 http 请求的表单信息，通常为请求 URL 中的 query 部分。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Form 实例。 |
| [`init(queryComponent: String)`](init.md) | 根据 URL 编码的查询字符串，即 URL 实例的 query 部分构造 Form 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(key: String, value: String): Unit`](add.md) | 新增 key-value 映射，如果 key 已存在，则将 value 添加到原来 value 数组的最后面。 |
| [`clone(): Form`](clone.md) | 克隆 Form。 |
| [`get(key: String): Option<String>`](get.md) | 根据 key 获取第一个对应的 value 值。 |
| [`getAll(key: String): ArrayList<String>`](getall.md) | 根据指定的键（key）获取该键（key）对应的所有 value 值。 |
| [`isEmpty(): Bool`](isempty.md) | 判断 Form 是否为空。 |
| [`remove(key: String): Unit`](remove.md) | 删除 key 及其对应 value。 |
| [`set(key: String, value: String): Unit`](set.md) | 重置指定 key 对应的 value。 |
| [`toEncodeString(): String`](toencodestring.md) | 对表单中的键值对进行编码，编码采用百分号编码。 |
