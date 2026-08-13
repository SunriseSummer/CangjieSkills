<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.class.prettyprinter.filllimitedspace" parent="std.unittest.common.class.prettyprinter" -->
# PrettyPrinter.fillLimitedSpace

[← PrettyPrinter](index.md)

## 签名

```cangjie role=signature
public open func fillLimitedSpace(spaceSize: Int64, body: () -> Unit): c
```

指定大小填充代码块。

## 契约

参数：

- spaceSize: Int64  - 所指定的大小。
- body: () -\> body - 填充的方式。

返回值：

- PrettyPrinter - 打印器。
