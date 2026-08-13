<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.filehandler" parent="stdx.net.http" -->
# FileHandler

[← stdx.net.http](../../index.md)

`FileHandler <: HttpRequestHandler`

用于处理文件下载或者文件上传。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(path: String, handlerType!: FileHandlerType = DownLoad, bufferSize!: Int64 = 64 * 1024)`](init.md) | FileHandler 的构造函数。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`handle(ctx: HttpContext): Unit`](handle.md) | 根据请求对响应数据进行处理。 |
