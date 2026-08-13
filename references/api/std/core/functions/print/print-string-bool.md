<!-- cj-doc kind="api-member" level="6" id="std.core.func.print.print-string-bool" parent="std.core.func.print" -->
# print(String, Bool)

[← print](index.md)

## 签名

```cangjie role=signature
public func print(str: String, flush!: Bool = false): Unit
```

向控制台输出指定字符串。

## 契约

参数：

- str: String - 待输出的字符串。
- flush!: Bool - 是否清空缓存，true 清空，false 不清空，默认 false。
