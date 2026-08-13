<!-- cj-doc kind="api-member" level="6" id="std.core.func.print.print-rune-bool" parent="std.core.func.print" -->
# print(Rune, Bool)

[← print](index.md)

## 签名

```cangjie role=signature
public func print(c: Rune, flush!: Bool = false): Unit
```

向控制台输出 Rune 类型数据的字符串表达。

## 契约

参数：

- c: Rune - 待输出的 Rune 类型数据。
- flush!: Bool - 是否清空缓存，true 清空，false 不清空，默认 false。
