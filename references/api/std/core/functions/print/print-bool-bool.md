<!-- cj-doc kind="api-member" level="6" id="std.core.func.print.print-bool-bool" parent="std.core.func.print" -->
# print(Bool, Bool)

[← print](index.md)

## 签名

```cangjie role=signature
public func print(b: Bool, flush!: Bool = false): Unit
```

向控制台输出 Bool 类型数据的字符串表达。

## 契约

> **注意：**
>
> 下列 print、 println、 eprint、 eprintln 函数默认为 UTF-8 编码。

参数：

- b: Bool - 待输出的 Bool 类型数据。
- flush!: Bool - 是否清空缓存，true 清空，false 不清空，默认 false。
