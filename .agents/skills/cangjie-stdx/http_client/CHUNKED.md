# 分块传输与 Trailer（Chunked Transfer-Encoding）

本文档详细介绍 HTTP 客户端的分块传输（Chunked）和 Trailer 功能。核心 HTTP 客户端用法请参阅 [README.md](./README.md)。

---

## 1. 概述

HTTP 分块传输编码（`Transfer-Encoding: chunked`）允许在不预先知道 body 大小的情况下逐块发送数据。适用于：

- 上传大文件
- 流式数据传输
- 需要在 body 结束后发送 Trailer 头（如校验和）

---

## 2. 自定义 InputStream Body

要使用分块传输，需要提供一个实现 `InputStream` 接口的自定义 body 类。以下是一个文件读取的 body 实现：

```cangjie
import std.io.*
import std.fs.*

class FileBody <: InputStream {
    var file: File

    init(path: String) {
        file = File(path, Read)
    }

    public func read(buf: Array<UInt8>): Int64 {
        file.read(buf)
    }
}
```

---

## 3. 完整示例：Chunked 上传 + Trailer

以下示例展示使用分块传输上传文件，并在 body 结束后发送 `checksum` Trailer 头。

```cangjie
import std.io.*
import std.fs.*
import stdx.net.http.*

func checksum(chunk: Array<UInt8>): Int64 {
    var sum = 0
    for (i in chunk) {
        if (i == b'\n') {
            sum += 1
        }
    }
    return sum / 2
}

main() {
    let client = ClientBuilder().build()

    let requestBuilder = HttpRequestBuilder()
    let file = File("./res.jpg", Read)
    let sum = checksum(readToEnd(file))

    let req = requestBuilder
        .method("PUT")
        .url("https://example.com/src/")
        .header("Transfer-Encoding", "chunked")
        .header("Trailer", "checksum")
        .body(FileBody("./res.jpg"))
        .trailer("checksum", sum.toString())
        .build()

    let rsp = client.send(req)
    println(rsp)

    client.close()
}

class FileBody <: InputStream {
    var file: File

    init(path: String) {
        file = File(path, Read)
    }

    public func read(buf: Array<UInt8>): Int64 {
        file.read(buf)
    }
}
```

> **说明**：`res.jpg` 文件需由用户根据实际环境提供。此示例演示分块上传和 Trailer 的完整用法。

---

## 4. Trailer 头

Trailer 是在分块传输的 body 全部发送完成之后附加的 HTTP 头。典型用途：

- 校验和（checksum）
- 数字签名
- 最终状态信息

### 使用步骤

1. 在请求头中声明 Trailer 字段名：`.header("Trailer", "checksum")`
2. 设置请求体为 `InputStream`（触发分块传输）：`.body(FileBody("./file"))`
3. 设置 Trailer 值：`.trailer("checksum", value)`

### 读取响应 Trailer

```cangjie
import stdx.net.http.*
import std.io.StringReader

main() {
    let client = ClientBuilder().build()

    let resp = client.get("http://example.com/chunked-response")
    let body = StringReader(resp.body).readToEnd()
    println("Body: ${body}")

    // body 读取完成后可获取 Trailer
    let trailers = resp.trailers
    // 通过 get 获取指定 Trailer 字段值
    let values = trailers.get("checkSum")
    for (v in values) {
        println("checkSum: ${v}")
    }

    client.close()
}
```

> **重要**：Trailer 只有在 body 完全读取之后才可用。

---

## 5. 速查

| 操作 | 用法 |
|------|------|
| 分块传输 | `.header("Transfer-Encoding", "chunked").body(inputStream)` |
| 声明 Trailer | `.header("Trailer", "fieldName")` |
| 设置 Trailer 值 | `.trailer("fieldName", "value")` |
| 自定义 InputStream | 实现 `InputStream` 接口的 `read(buf: Array<UInt8>): Int64` 方法 |
| 读取响应 Trailer | `resp.trailers`（需先完整读取 body） |
