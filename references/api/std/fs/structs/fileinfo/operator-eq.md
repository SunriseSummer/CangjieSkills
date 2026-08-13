<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.operator-eq" parent="std.fs.struct.fileinfo" -->
# FileInfo.==

[← FileInfo](index.md)

## 签名

```cangjie role=signature
public operator func ==(that: FileInfo): Bool
```

判断当前 FileInfo 和另一个 FileInfo 是否对应同一文件。

## 契约

参数：

- that: FileInfo - 另一个 FileInfo。

返回值：

- Bool - true，是同一文件；false，不是同一文件。
