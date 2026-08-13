<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.canwrite" parent="std.fs.struct.fileinfo" -->
# FileInfo.canWrite

[← FileInfo](index.md)

## 签名

```cangjie role=signature
public func canWrite(): Bool
```

判断当前用户是否有权限写入该实例对应的文件。

## 契约

- 对文件而言，判断用户是否有写入文件的权限。
- 对目录而言，判断用户是否有删除、移动、创建目录内文件的权限。
- 在 Windows 环境下，用户对于文件的可写权限正常使用，用户始终拥有对于目录的可写权限，该函数不生效，返回 true。
- 在 Linux 和 macOS 环境下，该函数正常使用。

返回值：

- Bool - true 表示有权限；false 表示无权限。

异常：

- FSException - 如果判断过程中底层接口发生错误，则抛出异常。
