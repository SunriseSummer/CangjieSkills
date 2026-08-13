<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.isreadonly" parent="std.fs.struct.fileinfo" -->
# FileInfo.isReadOnly

[← FileInfo](index.md)

## 签名

```cangjie role=signature
public func isReadOnly(): Bool
```

判断当前文件是否只读。

## 契约

- 在 Windows 环境下，用户对于文件的只读权限正常使用；用户始终拥有对于目录的删除修改权限，该函数不生效，返回 false。
- 在 Linux 和 macOS 环境下，该函数正常使用。

返回值：

- Bool - true 表示是只读；false 表示不是只读。

异常：

- FSException - 如果判断过程中底层接口发生错误，则抛出异常。
