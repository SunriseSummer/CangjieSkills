<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.measure" parent="std.unittest.testmacro" -->
# @Measure

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@Measure
```

用于为性能测试指定 Measurement 实例。

## 契约

功能：用于为性能测试指定 Measurement 实例。只能应用于标有 `@Test` 宏的类或顶级函数的范围内。
对于每个 `Measurement`，都会进行不同的测量。因此，指定更多 `Measurement` 实例，将花费更多时间进行性能测试。
默认值为 TimeNow() ，它在内部使用 DateTime.now() 进行测量。

例如：

输出的测试报告如下：

```text
| Case      | Measurement  |   Median |         Err |   Err% |     Mean |
|:----------|:-------------|---------:|------------:|-------:|---------:|
| someBench | Duration     | 6.319 us | ±0.00019 us |  ±0.0% | 6.319 us |
|           |              |          |             |        |          |
| someBench | Duration(ns) |  6308 ns |   ±0.147 ns |  ±0.0% |  6308 ns |
```

`CSV` 报告如下：

```csv
Case,Args,Median,Err,Err%,Mean,Unit,Measurement
"someBench",,"6319","0.185632","0.0","6319","ns","Duration"
"someBench",,"6308","0.146873","0.0","6308","ns","Duration(ns)"
```
