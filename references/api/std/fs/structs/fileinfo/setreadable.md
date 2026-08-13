<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.setreadable" parent="std.fs.struct.fileinfo" -->
# FileInfo.setReadable

[← FileInfo](index.md)

## 签名

```cangjie role=signature
public func setReadable(readable: Bool): Bool
```

对当前实例对应的文件设置文件所有者是否可读取的权限，当前用户没有权限修改则抛出异常。

## 契约

- 对文件而言，设置用户是否有读取文件的权限。
- 对目录而言，设置用户是否有浏览目录的权限。
- 在 Windows 环境下，用户始终拥有对于文件以及目录的可读权限，不可更改，该函数不生效当 readable 为 true 时，函数返回 true，当 readable 为 false 时，函数返回 false。
- 在 Linux 和 macOS 环境下，该函数正常使用如果在此函数调用期间，该 FileInfo 对应的文件实体被其他用户或者进程修改，有可能因为竞争条件(Race Condition)导致其他修改不能生效。

参数：

- readable: Bool - 是否设置可读。

返回值：

- Bool - true，操作成功；false，操作失败。
