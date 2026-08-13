<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.interface.prettyprintable.pprint" parent="std.unittest.common.interface.prettyprintable" -->
# PrettyPrintable.pprint

[← PrettyPrintable](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func pprint(PrettyPrinter)

### 签名

```cangjie role=signature
func pprint(to: PrettyPrinter): PrettyPrinter
```

将类型值打印到指定的打印器中。

### 契约

参数：

- to: PrettyPrinter - 打印器。

返回值：

- PrettyPrinter - 打印器。

## func pprint(PrettyPrinter)

适用扩展：[extend<T> Array<T> <: PrettyPrintable where T <: PrettyPrintable](extensions/extend-t-array-t-prettyprintable-where-t-prettyprintable.md)。

### 签名

```cangjie role=signature
public func pprint(to: PrettyPrinter): PrettyPrinter
```

将类型值打印到指定的打印器中。

### 契约

参数：

- to: PrettyPrinter - 打印器。

返回值：

- PrettyPrinter - 打印器。

## func pprint(PrettyPrinter)

适用扩展：[extend<T> ArrayList<T> <: PrettyPrintable where T <: PrettyPrintable](extensions/extend-t-arraylist-t-prettyprintable-where-t-prettyprintable.md)。

### 签名

```cangjie role=signature
public func pprint(to: PrettyPrinter): PrettyPrinter
```

将类型值打印到指定的打印器中。

### 契约

参数：

- to: PrettyPrinter - 打印器。

返回值：

- PrettyPrinter - 打印器。
