<!-- cj-doc kind="api-member" level="6" id="std.unittest.diff.interface.assertprintable.pprintforassertion" parent="std.unittest.diff.interface.assertprintable" -->
# AssertPrintable.pprintForAssertion

[← AssertPrintable](index.md)

本页汇总 6 个同名重载；先按签名选择，再读取对应契约。

## func pprintForAssertion(PrettyPrinter, T, String, String, Int64)

### 签名

```cangjie role=signature
func pprintForAssertion(
    pp: PrettyPrinter, that: T, thisPrefix: String, thatPrefix: String, level: Int64
): PrettyPrinter
```

打印 @Assert/@Expect 的检查结果的方法。

### 契约

参数：

- pp: PrettyPrinter - 打印器。
- that: T - 待打印的信息。
- thisPrefix: String - 预期内容的前缀。
- thatPrefix: String - 实际内容的前缀。
- level: Int64 - 嵌套层级。

返回值：

- PrettyPrinter - 打印器。

## func pprintForAssertion(PrettyPrinter, Float16, String, String, Int64)

适用扩展：[extend Float16 <: AssertPrintable<Float16>](extensions/extend-float16-assertprintable-float16.md)。

### 签名

```cangjie role=signature
public func pprintForAssertion(
    pp: PrettyPrinter, that: Float16, thisPrefix: String, thatPrefix: String, level: Int64
): PrettyPrinter
```

打印 @Assert/@Expect 的检查结果的方法。

### 契约

参数：

- pp: PrettyPrinter - 打印器。
- that: Float16 - 待打印的信息。
- thisPrefix: String - 预期内容的前缀。
- thatPrefix: String - 实际内容的前缀。
- level: Int64 - 嵌套层级。

返回值：

- PrettyPrinter - 打印器。

## func pprintForAssertion(PrettyPrinter, Float32, String, String, Int64)

适用扩展：[extend Float32 <: AssertPrintable<Float32>](extensions/extend-float32-assertprintable-float32.md)。

### 签名

```cangjie role=signature
public func pprintForAssertion(
    pp: PrettyPrinter, that: Float32, thisPrefix: String, thatPrefix: String, level: Int64
): PrettyPrinter
```

打印 @Assert/@Expect 的检查结果的方法。

### 契约

参数：

- pp: PrettyPrinter - 打印器。
- that: Float32 - 待打印的信息。
- thisPrefix: String - 预期内容的前缀。
- thatPrefix: String - 实际内容的前缀。
- level: Int64 - 嵌套层级。

返回值：

- PrettyPrinter - 打印器。

## func pprintForAssertion(PrettyPrinter, Float64, String, String, Int64)

适用扩展：[extend Float64 <: AssertPrintable<Float64>](extensions/extend-float64-assertprintable-float64.md)。

### 签名

```cangjie role=signature
public func pprintForAssertion(
    pp: PrettyPrinter, that: Float64, thisPrefix: String, thatPrefix: String, level: Int64
): PrettyPrinter
```

打印 @Assert/@Expect 的检查结果的方法。

### 契约

参数：

- pp: PrettyPrinter - 打印器。
- that: Float64 - 待打印的信息。
- thisPrefix: String - 预期内容的前缀。
- thatPrefix: String - 实际内容的前缀。
- level: Int64 - 嵌套层级。

返回值：

- PrettyPrinter - 打印器。

## func pprintForAssertion(PrettyPrinter, Option<T>, String, String, Int64)

适用扩展：[extend<T> Option<T> <: AssertPrintable<Option<T>> where T <: Equatable<T>](extensions/extend-t-option-t-assertprintable-option-t-where-t-equatable-t.md)。

### 签名

```cangjie role=signature
public func pprintForAssertion(
    pp: PrettyPrinter, that:  Option<T>, thisPrefix: String, thatPrefix: String, level: Int64
): PrettyPrinter
```

打印 @Assert/@Expect 的检查结果的方法。

### 契约

参数：

- pp: PrettyPrinter - 打印器。
- that:  Option\<T> - 待打印的信息。
- thisPrefix: String - 预期内容的前缀。
- thatPrefix: String - 实际内容的前缀。
- level: Int64 - 嵌套层级。

返回值：

- PrettyPrinter - 打印器。

## func pprintForAssertion(PrettyPrinter, String, String, String, Int64)

适用扩展：[extend String <: AssertPrintable<String>](extensions/extend-string-assertprintable-string.md)。

### 签名

```cangjie role=signature
public func pprintForAssertion(
    pp: PrettyPrinter, that: String, thisPrefix: String, thatPrefix: String, level: Int64
): PrettyPrinter
```

打印 @Assert/@Expect 的检查结果的方法。

### 契约

参数：

- pp: PrettyPrinter - 打印器。
- that: String - 待打印的信息。
- thisPrefix: String - 预期内容的前缀。
- thatPrefix: String - 实际内容的前缀。
- level: Int64 - 嵌套层级。

返回值：

- PrettyPrinter - 打印器。
