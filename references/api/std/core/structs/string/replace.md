<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.replace" parent="std.core.struct.string" -->
# String.replace

[← String](index.md)

## 签名

```cangjie role=signature
public func replace(old: String, new: String): String
```

使用新字符串替换原字符串中旧字符串。

## 契约

参数：

- old: String - 旧字符串。
- new: String - 新字符串。

返回值：

- String - 替换后的新字符串。

异常：

- OutOfMemoryError - 如果此函数分配内存时产生错误，抛出异常。
