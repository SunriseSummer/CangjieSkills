<!-- cj-doc kind="api-member" level="6" id="std.process.enum.processredirect.value-fromfile-file" parent="std.process.enum.processredirect" -->
# ProcessRedirect.FromFile(File)

[← ProcessRedirect](index.md)

## 签名

```cangjie role=signature
FromFile(File)
```

构造一个标准流重定向枚举实例，表示子进程标准流将被重定向至指定的文件。

## 契约

功能：构造一个标准流重定向枚举实例，表示子进程标准流将被重定向至指定的文件。重定向标准输入流将从指定文件读取，重定向标准输出流或标准错误流将写入至指定文件。重定向文件需保证存在且未关闭，否则不允许重定向。此模式下标准流属性不可读取或写入。参数 File 为指定存在且未关闭文件实例，创建子进程时，重定向标准流至该指定文件。
