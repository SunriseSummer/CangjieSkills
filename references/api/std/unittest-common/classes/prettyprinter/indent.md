<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.class.prettyprinter.indent" parent="std.unittest.common.class.prettyprinter" -->
# PrettyPrinter.indent

[← PrettyPrinter](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func indent(() -> Unit)

### 签名

```cangjie role=signature
public func indent(body: () -> Unit): PrettyPrinter
```

对闭包中给打印器增加的字符串指定额外缩进一次。

### 契约

功能：对闭包中给打印器增加的字符串指定额外缩进一次。

## func indent(UInt64, () -> Unit)

### 签名

```cangjie role=signature
public func indent(indents: UInt64, body: () -> Unit): PrettyPrinter
```

对闭包中给打印器增加的字符串指定额外缩进指定次数。

### 契约

功能：对闭包中给打印器增加的字符串指定额外缩进指定次数。
