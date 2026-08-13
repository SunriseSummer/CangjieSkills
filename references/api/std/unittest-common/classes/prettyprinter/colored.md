<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.class.prettyprinter.colored" parent="std.unittest.common.class.prettyprinter" -->
# PrettyPrinter.colored

[← PrettyPrinter](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func colored(Color, () -> Unit)

### 签名

```cangjie role=signature
public func colored(color: Color, body: () -> Unit): PrettyPrinter
```

对闭包中给打印器增加的字符串指定颜色。

### 契约

功能：对闭包中给打印器增加的字符串指定颜色。

## func colored(Color, String)

### 签名

```cangjie role=signature
public func colored(color: Color, text: String): PrettyPrinter
```

对给打印器增加的字符串指定颜色。

### 契约

参数：

- color: Color - 指定打印的颜色。
- text: String - 添加的字符串。

返回值：

- PrettyPrinter - 打印器。
