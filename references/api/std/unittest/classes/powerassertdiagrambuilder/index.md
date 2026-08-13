<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.powerassertdiagrambuilder" parent="std.unittest" -->
# PowerAssertDiagramBuilder

[← std.unittest](../../index.md)

`PowerAssertDiagramBuilder`

PowerAssert 输出结果构造器。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(expression: String)`](init.md) | 构造函数。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`r<T>( value: T, exprAsText: String, position: Int64 ): T`](r.md) | 记录对比数据。 |
| [`r( value: String, exprAsText: String, position: Int64 ): String`](r.md) | 记录对比数据。 |
| [`r( value: Rune, exprAsText: String, position: Int64 ): Rune`](r.md) | 记录对比数据。 |
| [`h( exception: Exception, exprAsText: String, position: Int64 ): Nothing`](h.md) | 处理异常。 |
| [`w(passed: Bool): Unit`](w.md) | 当用例通过时返回成功结果，失败时抛出异常并打印对比结果。 |
