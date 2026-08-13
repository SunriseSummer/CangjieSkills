<!-- cj-doc kind="api-member" level="6" id="std.core.func.print.print-float32-bool" parent="std.core.func.print" -->
# print(Float32, Bool)

[← print](index.md)

## 签名

```cangjie role=signature
public func print(f: Float32, flush!: Bool = false): Unit
```

向控制台输出 Float32 类型数据的小数点后六位的字符串表达，即超出六位的小数位不会输出，不足六位的小数位会补零。

## 契约

参数：

- f: Float32 - 待输出的 Float32 类型数据。
- flush!: Bool - 是否清空缓存，true 清空，false 不清空，默认 false。
