<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.isregular" parent="std.fs.struct.fileinfo" -->
# FileInfo.isRegular

[← FileInfo](index.md)

## 签名

```cangjie role=signature
public func isRegular(): Bool
```

判断当前文件是否是普通文件。

## 契约

返回值：

- Bool - true 表示是文件；false 表示不是文件。

异常：

- FSException - 如果判断过程中底层接口发生错误，则抛出异常。
