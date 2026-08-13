<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.filehandler.init" parent="stdx.net.http.class.filehandler" -->
# FileHandler.init

[← FileHandler](index.md)

## 签名

```cangjie role=signature
public init(path: String, handlerType!: FileHandlerType = DownLoad, bufferSize!: Int64 = 64 * 1024)
```

FileHandler 的构造函数。

## 契约

参数：

- path: String - FileHandler 构造时需要传入的文件或者目录路径字符串，上传模式中只能传入存在的目录路径；路径中存在../时，用户需要确认标准化后的绝对路径是期望传入的路径。
- handlerType!: FileHandlerType - 构造 FileHandler 时指定当前 FileHandler 的工作模式，默认为 DownLoad 下载模式。
- bufferSize!: Int64 - 内部从网络读取或者写入的缓冲区大小，默认值为 64*1024（64k），若小于 4096，则使用 4096 作为缓冲区大小。

异常：

- HttpException - 当 path 不存在时，抛出异常。
- IllegalArgumentException - 参数错误时抛出异常，如 path 为空或者包含空字符串等。
