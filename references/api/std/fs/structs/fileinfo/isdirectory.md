<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.isdirectory" parent="std.fs.struct.fileinfo" -->
# FileInfo.isDirectory

[← FileInfo](index.md)

## 签名

```cangjie role=signature
public func isDirectory(): Bool
```

判断当前文件是否是目录。

## 契约

返回值：

- Bool - true 表示是目录；false 表示不是目录。

异常：

- FSException - 如果判断过程中底层接口发生错误，则抛出异常。
