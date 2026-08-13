<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.issymboliclink" parent="std.fs.struct.fileinfo" -->
# FileInfo.isSymbolicLink

[← FileInfo](index.md)

## 签名

```cangjie role=signature
public func isSymbolicLink(): Bool
```

判断当前文件是否是软链接。

## 契约

返回值：

- Bool - true 表示是软链接；false 表示不是软链接。

异常：

- FSException - 如果判断过程中底层接口发生错误，则抛出异常。
