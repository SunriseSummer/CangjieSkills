<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.setlength" parent="std.fs.class.file" -->
# File.setLength

[← File](index.md)

## 签名

```cangjie role=signature
public func setLength(length: Int64): Unit
```

将当前文件截断为指定长度。

## 契约

功能：将当前文件截断为指定长度。当 length 大于当前文件长度时，则将使用 0 填充文件直到目标长度。此方法不会改变文件光标的位置。

参数：

- length: Int64 - 指定截断的长度。

异常：

- IllegalArgumentException - 指定的长度为负数时抛出异常。
- FSException - 文件截断操作失败时，抛出异常。
