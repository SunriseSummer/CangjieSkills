<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.close" parent="std.fs.class.file" -->
# File.close

[← File](index.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭当前 File 对象。

## 契约

异常：

- FSException - 如果关闭失败，则抛出异常。
