<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.class.prettytext.of" parent="std.unittest.common.class.prettytext" -->
# PrettyText.of

[← PrettyText](index.md)

## 签名

```cangjie role=signature
public static func of<PP>(pp: PP): PrettyText where PP <: PrettyPrintable
```

通过打印从 PrettyPrintable 创建 PrettyText。

## 契约

参数：

- pp: PP  - 一个实现了 PrettyPrintable 的类型。

返回值：

- PrettyText - 打印文本对象。
