<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.canexecute" parent="std.fs.struct.fileinfo" -->
# FileInfo.canExecute

[← FileInfo](index.md)

## 签名

```cangjie role=signature
public func canExecute(): Bool
```

判断当前用户是否有权限执行该实例对应的文件。

## 契约

- 对文件而言，判断用户是否有执行文件的权限。
- 对目录而言，判断用户是否有进入目录的权限。
- 在 Windows 环境下，用户对于文件的执行权限由文件扩展名决定；用户始终拥有对于目录的执行权限，该函数不生效，返回 true。
- 在 Linux 和 macOS 环境下，该函数正常使用。

返回值：

- Bool - true 表示有权限；false 表示无权限。

异常：

- FSException - 如果判断过程中底层接口发生错误，则抛出异常。
